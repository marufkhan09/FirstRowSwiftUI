import SwiftUI
import WebKit

struct NewsDetailView: View {
    let url: URL
    let title: String
    @Environment(\.dismiss) private var dismiss
    @GestureState private var dragOffset: CGSize = .zero
    @EnvironmentObject var settings: AppSettings
    @State private var progress: Double = 0.0

    var body: some View {
        VStack {
            if progress < 1.0 {
                ProgressView(value: progress, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle())
                    .padding()
                    .accentColor(.blue)
            } else {
                WebView(url: url, progress: $progress)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationTitle(title)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(AssetNames.Images.arrowleft)
                        .foregroundColor(.white)
                }
            }
        }
        .preferredColorScheme(settings.isDarkMode ? .dark : .light)
        .navigationBarModifier(
            backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0),
            foregroundColor: UIColor.white,
            tintColor: nil,
            withSeparator: false
        )
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .updating($dragOffset) { (value, state, _) in
                    state = value.translation
                }
                .onEnded { value in
                    if value.startLocation.x < 50 && value.translation.width > 100 {
                        dismiss()
                    }
                }
        )
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var progress: Double

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.addObserver(context.coordinator, forKeyPath: "estimatedProgress", options: .new, context: nil)
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    static func dismantleUIView(_ uiView: WKWebView, coordinator: Coordinator) {
        uiView.removeObserver(coordinator, forKeyPath: "estimatedProgress")
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
            if keyPath == "estimatedProgress" {
                DispatchQueue.main.async {
                    if let webView = object as? WKWebView {
                        self.parent.progress = webView.estimatedProgress
                        print("Progress: \(webView.estimatedProgress)")  // Debug statement
                    }
                }
            }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.parent.progress = 1.0
            }
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async {
                self.parent.progress = 1.0
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewsDetailView(url: URL(string: "https://facebook.com")!, title: "Example News")
            .environmentObject(AppSettings())
    }
}
