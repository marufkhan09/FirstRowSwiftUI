//
//  UnderlinedButton.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 23/8/24.
//

import SwiftUI

struct UnderlinedButton: View {
    var title: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .underline()

            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    UnderlinedButton(title: "Forget Password")
}
