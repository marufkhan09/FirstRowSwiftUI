//
//  SideBySideImageView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 15/8/24.
//

import SwiftUI

struct SideBySideImageView: View {
    let images: [Image]

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<images.count, id: \.self) { index in
                images[index]
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 2 - 15, height: 200)
                    .clipped()
                    .cornerRadius(10)
            }
        }
    }
}


