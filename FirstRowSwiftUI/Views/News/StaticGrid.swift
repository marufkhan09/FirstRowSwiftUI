import SwiftUI
import WebKit

struct DynamicGrid: View {
    let items: [NewsItem]

    private let pattern: [CardSize] = [.full, .hhalf, .full, .vhhalf]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 2) {
                ForEach(0..<itemGroups.count, id: \.self) { index in
                    let itemGroup = itemGroups[index]
                    
                    switch itemGroup.size {
                    case .full:
                        NewsCardView(item: itemGroup.items[0], size: .full)
                            .frame(maxWidth: .infinity)
                            .clipped()
                        
                    case .hhalf:
                        HStack(spacing: 2) {
                            NewsCardView(item: itemGroup.items[0], size: .hhalf)
                                .clipped()
                            
                            if itemGroup.items.count > 1 {
                                NewsCardView(item: itemGroup.items[1], size: .hhalf)
                                    .clipped()
                            }
                        }
                        
                    case .vhhalf:
                        HStack(spacing: 2) {
                            if itemGroup.items.count > 0 {
                                NewsCardView(item: itemGroup.items[0], size: .vhhalf)
                                    .frame(width: UIScreen.main.bounds.width / 2, height: 240)
                                    .clipped()
                            }
                            
                            VStack(spacing: 2) {
                                if itemGroup.items.count > 1 {
                                    NewsCardView(item: itemGroup.items[1], size: .vhhalf)
                                        .frame(width: UIScreen.main.bounds.width / 2, height: 120)
                                        .clipped()
                                }
                                
                                if itemGroup.items.count > 2 {
                                    NewsCardView(item: itemGroup.items[2], size: .vhhalf)
                                        .frame(width: UIScreen.main.bounds.width / 2, height: 120)
                                        .clipped()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Computed property to group items according to the pattern
    private var itemGroups: [(size: CardSize, items: [NewsItem])] {
        var result: [(size: CardSize, items: [NewsItem])] = []
        var index = 0

        while index < items.count {
            let patternIndex = result.count % pattern.count
            let cardSize = pattern[patternIndex]
            
            switch cardSize {
            case .full:
                if index < items.count {
                    result.append((size: .full, items: [items[index]]))
                    index += 1
                }
                
            case .hhalf:
                if index < items.count {
                    let end = min(index + 2, items.count)
                    result.append((size: .hhalf, items: Array(items[index..<end])))
                    index = end
                }
                
            case .vhhalf:
                if index < items.count {
                    let end = min(index + 3, items.count)
                    result.append((size: .vhhalf, items: Array(items[index..<end])))
                    index = end
                }
            }
        }

        return result
    }
}

struct NewsCardView: View {
    let item: NewsItem
    let size: CardSize

    @State private var isWebViewPresented = false

    var body: some View {
        ZStack(alignment: .bottom) {
            // Background Image
            AsyncImage(url: URL(string: item.image!)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(maxWidth: size.maxWidth, maxHeight: size.maxHeight)
                     .clipped()
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: size.maxWidth, maxHeight: size.maxHeight)
            }

            // Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [
                    AssetNames.Colors.primaryColor,
                    // Darker color at the bottom
 AssetNames.Colors.primaryColor.opacity(0.8)      ,
                    // Darker color at the bottom
 AssetNames.Colors.primaryColor.opacity(0.3),
                    // Darker color at the bottom
 AssetNames.Colors.primaryColor.opacity(0.1)        // Lighter color at the top// Lighter color at the top// Lighter color at the top
                ]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(maxWidth: size.maxWidth, maxHeight: size.maxHeight / 3)


            // Title and bottom content
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title ?? "")
                    .font(.subheadline)
                    .padding(.horizontal, 4)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .frame(maxWidth: size.maxWidth, alignment: .leading)
                
                HStack {
                    Text("FirstRowPick")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.leading, 6)
                    
                    Spacer()
                    
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.white)
                        .padding(.trailing, 6)
                        .onTapGesture {
                            shareLink(url: item.url ?? "")
                        }
                }
            }
            .padding(.bottom, 8)
            .frame(maxWidth: size.maxWidth, maxHeight: size.maxHeight / 3, alignment: .bottom)
        }
        .onTapGesture {
            isWebViewPresented = true
        }
        .sheet(isPresented: $isWebViewPresented) {
            WebView(url: URL(string: item.url ?? "")!)
        }
    }

    private func shareLink(url: String) {
        guard let url = URL(string: url) else { return }
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let rootViewController = windowScene.windows.first?.rootViewController {
                rootViewController.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
}

struct WebView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> UIViewController {
        let webView = WKWebView()
        let viewController = UIViewController()
        viewController.view.addSubview(webView)
        webView.frame = viewController.view.bounds
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.load(URLRequest(url: url))
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct DynamicGrid_Previews: PreviewProvider {
    static var previews: some View {
        DynamicGrid(items: [
            NewsItem(id: 1, image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: false, publishDate: "2024-04-20", sourceId: 1, title: "Sample News Title 1", url: "https://medium.com/@aestusLabs/adding-a-uicollectionviews-to-a-custom-uitableviewcell-xib-tutorial-swift-4-xcode-9-2-1ec9ce4095d3"),
            NewsItem(id: 2, image: "https://images.pexels.com/photos/1485313/pexels-photo-1485313.jpeg?auto=compress&cs=tinysrgb&w=600", isMagazine: false, publishDate: "2024-04-22", sourceId: 2, title: "Sample News Title 2", url: "https://medium.com/@aestusLabs/yet-another-article-link"),
            NewsItem(id: 3, image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: false, publishDate: "2024-04-20", sourceId: 3, title: "Sample News Title 3", url: "https://medium.com/@aestusLabs/adding-a-uicollectionviews-to-a-custom-uitableviewcell-xib-tutorial-swift-4-xcode-9-2-1ec9ce4095d3"),
            NewsItem(id: 4, image: "https://images.pexels.com/photos/1485313/pexels-photo-1485313.jpeg?auto=compress&cs=tinysrgb&w=600", isMagazine: false, publishDate: "2024-04-22", sourceId: 4, title: "Sample News Title 4", url: "https://medium.com/@aestusLabs/yet-another-article-link"),
            NewsItem(id: 5, image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: false, publishDate: "2024-04-20", sourceId: 5, title: "Sample News Title 5", url: "https://medium.com/@aestusLabs/adding-a-uicollectionviews-to-a-custom-uitableviewcell-xib-tutorial-swift-4-xcode-9-2-1ec9ce4095d3"),
            NewsItem(id: 6, image: "https://images.pexels.com/photos/1485313/pexels-photo-1485313.jpeg?auto=compress&cs=tinysrgb&w=600", isMagazine: false, publishDate: "2024-04-22", sourceId: 6, title: "Sample News Title 6", url: "https://medium.com/@aestusLabs/yet-another-article-link"), NewsItem(id: 7, image: "https://images.pexels.com/photos/1485313/pexels-photo-1485313.jpeg?auto=compress&cs=tinysrgb&w=600", isMagazine: false, publishDate: "2024-04-22", sourceId: 7, title: "Sample News Title 7", url: "https://medium.com/@aestusLabs/yet-another-article-link"),
        ])
        .previewLayout(.sizeThatFits)
    }
}



enum CardSize {
    case full
    case hhalf
    case vhhalf
    
    var maxWidth: CGFloat {
        switch self {
        case .full:
            return .infinity
        case .hhalf, .vhhalf:
            return UIScreen.main.bounds.width / 2
        }
    }
    
    var maxHeight: CGFloat {
        switch self {
        case .full:
            return 240
        case .hhalf:
            return 240
        case .vhhalf:
            return 240
        }
    }
}
