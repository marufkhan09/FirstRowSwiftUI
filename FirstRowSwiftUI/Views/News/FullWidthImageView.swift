//
//  FullWidthImageView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 15/8/24.
//



import SwiftUI

struct FullWidthImageView: View {
    let image: Image

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 200)
            .clipped()
            .cornerRadius(10)
    }
}

struct FullWidthImageView_Previews: PreviewProvider {
    static var previews: some View {
        FullWidthImageView(image: Image("image1"))
    }
}
