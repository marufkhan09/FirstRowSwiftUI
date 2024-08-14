//
//  NewsView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//


import SwiftUI

struct NewsView: View {
    let newsItems = [
        NewsItem(
            id: 1,
            image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: false,
            publishDate: "2024-04-20",
            sourceId: 1,
            title: "Exciting News: SwiftUI Enhancements",
            url: "https://developer.apple.com/documentation/swiftui"
        ),
        NewsItem(
            id: 2,
            image: "https://images.pexels.com/photos/461952/pexels-photo-461952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: true,
            publishDate: "2024-05-01",
            sourceId: 2,
            title: "New Features in iOS 17",
            url: "https://www.apple.com/ios/ios17-preview/"
        ),
       
        NewsItem(
            id: 3,
            image: "https://images.pexels.com/photos/2397651/pexels-photo-2397651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: true,
            publishDate: "2024-08-20",
            sourceId: 5,
            title: "Exploring SwiftUI and Combine Integration",
            url: "https://www.swiftbysundell.com/articles/swiftui-and-combine/"
        ),
        NewsItem(
            id: 4,
            image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: false,
            publishDate: "2024-04-20",
            sourceId: 1,
            title: "Exciting News: SwiftUI Enhancements",
            url: "https://developer.apple.com/documentation/swiftui"
        ),
        NewsItem(
            id: 5,
            image: "https://images.pexels.com/photos/461952/pexels-photo-461952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: true,
            publishDate: "2024-05-01",
            sourceId: 2,
            title: "New Features in iOS 17",
            url: "https://www.apple.com/ios/ios17-preview/"
        ),
        NewsItem(
            id: 1,
            image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: false,
            publishDate: "2024-04-20",
            sourceId: 1,
            title: "Exciting News: SwiftUI Enhancements",
            url: "https://developer.apple.com/documentation/swiftui"
        ),
        NewsItem(
            id: 2,
            image: "https://images.pexels.com/photos/461952/pexels-photo-461952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: true,
            publishDate: "2024-05-01",
            sourceId: 2,
            title: "New Features in iOS 17",
            url: "https://www.apple.com/ios/ios17-preview/"
        ),
       
        NewsItem(
            id: 3,
            image: "https://images.pexels.com/photos/2397651/pexels-photo-2397651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: true,
            publishDate: "2024-08-20",
            sourceId: 5,
            title: "Exploring SwiftUI and Combine Integration",
            url: "https://www.swiftbysundell.com/articles/swiftui-and-combine/"
        ),
        NewsItem(
            id: 4,
            image: "https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: false,
            publishDate: "2024-04-20",
            sourceId: 1,
            title: "Exciting News: SwiftUI Enhancements",
            url: "https://developer.apple.com/documentation/swiftui"
        ),
        NewsItem(
            id: 5,
            image: "https://images.pexels.com/photos/461952/pexels-photo-461952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            isMagazine: true,
            publishDate: "2024-05-01",
            sourceId: 2,
            title: "New Features in iOS 17",
            url: "https://www.apple.com/ios/ios17-preview/"
        )
   
    ]


    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(newsItems) { item in
                    NewsCardView(item: item)
                }
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
