//import SwiftUI
//import UIKit
//import WebKit
//
//enum CardSize {
//    case full
//    case hhalf
//    case vhhalf
//
//    var maxWidth: CGFloat {
//        switch self {
//        case .full:
//            return .infinity
//        case .hhalf, .vhhalf:
//            return UIScreen.main.bounds.width / 2
//        }
//    }
//
//    var maxHeight: CGFloat {
//        switch self {
//        case .full, .hhalf:
//            return 240
//        case .vhhalf:
//            return 240
//        }
//    }
//}
//
//struct NewsCardView: View {
//    let item: NewsItem
//    let size: CardSize
//
//    @State private var isWebViewPresented = false
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            // Background Image
//            AsyncImage(url: URL(string: item.image!)) { image in
//                image.resizable()
//                     .aspectRatio(contentMode: .fill)
//                     .frame(maxWidth: size.maxWidth, maxHeight: size.maxHeight)
//                     .clipped()
//            } placeholder: {
//                ProgressView()
//                    .frame(maxWidth: size.maxWidth, maxHeight: size.maxHeight)
//            }
//
//            // Gradient Background
//            LinearGradient(
//                gradient: Gradient(colors: [Color(AssetNames.Colors.primaryColor), Color(AssetNames.Colors.gradColor).opacity(0.9)]),
//                startPoint: .bottom,
//                endPoint: .top
//            )
//            .frame(maxWidth: size.maxWidth, maxHeight: size.maxHeight / 2)
//            .opacity(1) // Adjust opacity if needed
//
//            // Title and bottom content
//            VStack(alignment: .leading, spacing: 4) {
//                Text(item.title ?? "")
//                    .font(.subheadline)
//                    .padding(.horizontal, 4)
//                    .lineLimit(2)
//                    .multilineTextAlignment(.leading)
//                    .foregroundColor(.white)
//                    .frame(maxWidth: size.maxWidth, alignment: .leading)
//                
//                HStack {
//                    Text("FirstRowPick")
//                        .font(.caption)
//                        .foregroundColor(.white)
//                        .padding(.leading, 6)
//                    
//                    Spacer()
//                    
//                    Image(systemName: "square.and.arrow.up")
//                        .foregroundColor(.white)
//                        .padding(.trailing, 6)
//                        .onTapGesture {
//                            shareLink(url: item.url ?? "")
//                        }
//                }
//            }
//            .padding(.bottom, 8)
//            .frame(maxWidth: size.maxWidth, maxHeight: size.maxHeight / 3, alignment: .bottom)
//        }
//        .onTapGesture {
//            isWebViewPresented = true
//        }
//        .sheet(isPresented: $isWebViewPresented) {
//            WebView(url: URL(string: item.url ?? "")!)
//        }
//    }
//
//    private func shareLink(url: String) {
//        guard let url = URL(string: url) else { return }
//        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//            if let rootViewController = windowScene.windows.first?.rootViewController {
//                rootViewController.present(activityViewController, animated: true, completion: nil)
//            }
//        }
//    }
//}
//
//struct WebView: UIViewControllerRepresentable {
//    let url: URL
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        let webView = WKWebView()
//        let viewController = UIViewController()
//        viewController.view.addSubview(webView)
//        webView.frame = viewController.view.bounds
//        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        webView.load(URLRequest(url: url))
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//}
//
//struct NewsCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCardView(
//            item: NewsItem(
//                id: 1,
//                image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                isMagazine: false,
//                publishDate: "2024-04-20",
//                sourceId: 1,
//                title: "Sample News Title - Check out this interesting article!",
//                url: "https://medium.com/@aestusLabs/adding-a-uicollectionviews-to-a-custom-uitableviewcell-xib-tutorial-swift-4-xcode-9-2-1ec9ce4095d3"
//            ),
//            size: .full
//        )
//    }
//}
//
//struct VhhalfView: View {
//    let firstItem: NewsItem
//    let secondItem: NewsItem
//    let thirdItem: NewsItem
//
//    var body: some View {
//        HStack(spacing: 2) {
//            // First Item
//            NewsCardView(item: firstItem, size: .vhhalf)
//                .frame(width: UIScreen.main.bounds.width / 2, height: 240)
//            
//            // VStack for the other two items
//            VStack(spacing: 2) {
//                NewsCardView(item: secondItem, size: .vhhalf)
//                    .frame(width: UIScreen.main.bounds.width / 2, height: 120)
//
//                NewsCardView(item: thirdItem, size: .vhhalf)
//                    .frame(width: UIScreen.main.bounds.width / 2, height: 120)
//            }
//        }
//    }
//}
