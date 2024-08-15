////
////  SideBySideNewsCardView.swift
////  FirstRowSwiftUI
////
////  Created by Maruf Khan on 15/8/24.
////
//
//import SwiftUI
//
//struct SideBySideNewsCardView: View {
//    let newsItems: [NewsItem]
//
//    var body: some View {
//        HStack(spacing: 10) {
//            ForEach(newsItems, id: \.id) { item in
//                NewsCardView(item: item)
//                    .frame(width: (UIScreen.main.bounds.width - 30) / 2, height: 200)
//            }
//        }
//    }
//}
//
//
