import SwiftUI

struct NewsCardView: View {
    let item: NewsItem
    let size: CardSize

    var body: some View {
        NavigationLink(destination: NewsDetailView(url: URL(string: item.url ?? "")!).navigationBarBackButtonHidden()) {
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
                        AssetNames.Colors.primaryColor.opacity(0.8),
                        AssetNames.Colors.primaryColor.opacity(0.3),
                        AssetNames.Colors.primaryColor.opacity(0.1)
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
                        
                        Image(AssetNames.Images.send)
                            .scaledToFill()
                            .frame(width: 30, height: 30)
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
