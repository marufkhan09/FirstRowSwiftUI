////
////  HalfWidthWithTwoNewsCardsView.swift
////  FirstRowSwiftUI
////
////  Created by Maruf Khan on 15/8/24.
////
//
//import SwiftUI
//
//struct HalfWidthWithTwoNewsCardsView: View {
//    let newsItems: [NewsItem]
//
//    var body: some View {
//        HStack(spacing: 10) {
//            if let firstItem = newsItems.first {
//                NewsCardView(item: firstItem)
//                    .frame(width: (UIScreen.main.bounds.width - 30) / 2, height: 200)
//            }
//
//            VStack(spacing: 10) {
//                if newsItems.count > 1 {
//                    NewsCardView(item: newsItems[1])
//                        .frame(width: (UIScreen.main.bounds.width - 30) / 2, height: 95)
//                }
//
//                if newsItems.count > 2 {
//                    NewsCardView(item: newsItems[2])
//                        .frame(width: (UIScreen.main.bounds.width - 30) / 2, height: 95)
//                }
//            }
//        }
//    }
//}
