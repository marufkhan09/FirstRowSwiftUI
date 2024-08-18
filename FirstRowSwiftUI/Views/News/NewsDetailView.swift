import SwiftUI
import WebKit

struct NewsDetailView: View {
    let url: URL
    @Environment(\.dismiss) private var dismiss
    @GestureState private var dragOffset: CGSize = .zero
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        WebView(url: url)
            .edgesIgnoringSafeArea(.all)
            .scrollIndicators(.hidden)
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
            .contentShape(Rectangle()) // Makes the whole view responsive to gestures
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { (value, state, _) in
                        state = value.translation
                    })
                    .onEnded { value in
                        if value.startLocation.x < 50 && value.translation.width > 100 {
                            dismiss()
                        }
                    }
            )
    }
}

#Preview {
    NavigationStack {
        NewsDetailView(url: URL(string: "https://facebook.com")!).environmentObject(AppSettings())
    }
}


struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update the web view if needed
    }
}

#Preview {
    NewsDetailView(url: URL(string: "https://facebook.com")!).environmentObject(AppSettings())
}
