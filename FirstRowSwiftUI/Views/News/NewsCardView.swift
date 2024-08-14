//
//  NewsCardView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 15/8/24.
//
import SwiftUI
import UIKit
import WebKit

struct NewsCardView: View {
    let item: NewsItem

    @State private var isWebViewPresented = false

    var body: some View {
        ZStack(alignment: .bottom) {
            // Background Image
            AsyncImage(url: URL(string: item.image!)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(maxWidth: .infinity, maxHeight: 200)
                     .clipped()
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 200)
            }

            // Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [Color(AssetNames.Colors.primaryColor), Color(AssetNames.Colors.gradColor).opacity(0.9)]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(maxWidth: .infinity, maxHeight: 120)
            .opacity(1) // Adjust opacity if needed

            // Title and bottom content
            VStack (alignment: .leading, spacing: 4) {
                Text(item.title ?? "")
                    .font(.subheadline)
                    .padding(.horizontal, 4)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("FirstRowPick")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.leading, 6)
                    
                    Spacer()
                    
                    Image(systemName: "square.and.arrow.up") // Example icon
                        .foregroundColor(.white)
                        .padding(.trailing, 6)
                        .onTapGesture {
                            shareLink(url: item.url ?? "")
                        }
                }
            }
            .padding(.bottom, 8)
            .frame(maxWidth: .infinity, maxHeight: 75, alignment: .bottom)
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

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(item: NewsItem(
            id: 1,
            image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: false,
            publishDate: "2024-04-20",
            sourceId: 1,
            title: "Sample News Title - Check out this interesting article!",
            url: "https://medium.com/@aestusLabs/adding-a-uicollectionviews-to-a-custom-uitableviewcell-xib-tutorial-swift-4-xcode-9-2-1ec9ce4095d3"
        ))
    }
}
