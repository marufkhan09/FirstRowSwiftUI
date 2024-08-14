//
//  HalfWidthWithTwoImagesView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 15/8/24.
//

import SwiftUI

struct HalfWidthWithTwoImagesView: View {
    let images: [Image]

    var body: some View {
        HStack(spacing: 10) {
            images[0]
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 2 - 15, height: 200)
                .clipped()
                .cornerRadius(10)

            VStack(spacing: 10) {
                images[1]
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 2 - 15, height: 95)
                    .clipped()
                    .cornerRadius(10)

                images[2]
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 2 - 15, height: 95)
                    .clipped()
                    .cornerRadius(10)
            }
        }
    }
}
