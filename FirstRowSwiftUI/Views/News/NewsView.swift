//import SwiftUI
//
//struct NewsView: View {
//var items:[NewsItem] = [
//    NewsItem(id: 1, image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: false, publishDate: "2024-04-20", sourceId: 1, title: "News 1", url: "https://medium.com/@aestusLabs/adding-a-uicollectionviews-to-a-custom-uitableviewcell-xib-tutorial-swift-4-xcode-9-2-1ec9ce4095d3"),
//    NewsItem(id: 2, image: "https://images.pexels.com/photos/461952/pexels-photo-461952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: true, publishDate: "2024-05-01", sourceId: 2, title: "News 2", url: "https://www.apple.com/ios/ios17-preview/"),
//  
//    NewsItem(id: 4, image: "https://images.pexels.com/photos/2397651/pexels-photo-2397651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: true, publishDate: "2024-08-20", sourceId: 5, title: "News 5", url: "https://www.swiftbysundell.com/articles/swiftui-and-combine/"),
//    NewsItem(id: 5, image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: false, publishDate: "2024-04-20", sourceId: 1, title: "News 1", url: "https://medium.com/@aestusLabs/adding-a-uicollectionviews-to-a-custom-uitableviewcell-xib-tutorial-swift-4-xcode-9-2-1ec9ce4095d3"),
//    NewsItem(id: 6, image: "https://images.pexels.com/photos/461952/pexels-photo-461952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: true, publishDate: "2024-05-01", sourceId: 2, title: "News 2", url: "https://www.apple.com/ios/ios17-preview/"),
//  
//    NewsItem(id: 7, image: "https://images.pexels.com/photos/2397651/pexels-photo-2397651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: true, publishDate: "2024-08-20", sourceId: 5, title: "News 5", url: "https://www.swiftbysundell.com/articles/swiftui-and-combine/"),
//    NewsItem(id: 8, image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: false, publishDate: "2024-04-20", sourceId: 1, title: "News 1", url: "https://medium.com/@aestusLabs/adding-a-uicollectionviews-to-a-custom-uitableviewcell-xib-tutorial-swift-4-xcode-9-2-1ec9ce4095d3"),
//    NewsItem(id: 9, image: "https://images.pexels.com/photos/461952/pexels-photo-461952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: true, publishDate: "2024-05-01", sourceId: 2, title: "News 2", url: "https://www.apple.com/ios/ios17-preview/"),
//  
//    NewsItem(id: 10, image: "https://images.pexels.com/photos/2397651/pexels-photo-2397651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", isMagazine: true, publishDate: "2024-08-20", sourceId: 5, title: "News 5", url: "https://www.swiftbysundell.com/articles/swiftui-and-combine/"),
//]
//
//    var body: some View {
//        ScrollView {
//            LazyVStack(spacing: 2) {
//                ForEach(chunkedItems(), id: \.self) { chunk in
//                    if chunk.count == 1 {
//                        FullWidthNewsCardView(newsItem: chunk[0])
//                    } else if chunk.count == 2 {
//                        SideBySideNewsCardView(newsItems: chunk)
//                    } else if chunk.count == 3 {
//                        HalfWidthWithTwoNewsCardsView(newsItems: chunk)
//                    }
//                }
//            }
//           
//        }
//    }
//
//    private func chunkedItems() -> [[NewsItem]] {
//        var chunks: [[NewsItem]] = []
//        var currentChunk: [NewsItem] = []
//
//        for (index, item) in items.enumerated() {
//            if index % 6 == 0 || index % 6 == 3 {
//                if !currentChunk.isEmpty {
//                    chunks.append(currentChunk)
//                    currentChunk.removeAll()
//                }
//                chunks.append([item])
//            } else {
//                currentChunk.append(item)
//                if currentChunk.count == 3 {
//                    chunks.append(currentChunk)
//                    currentChunk.removeAll()
//                }
//            }
//        }
//
//        if !currentChunk.isEmpty {
//            chunks.append(currentChunk)
//        }
//
//        return chunks
//    }
//}
//
//
//
//
//
//
//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}
