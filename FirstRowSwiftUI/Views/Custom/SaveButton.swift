//
//  SaveButton.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 23/8/24.
//

import SwiftUI

struct SaveButton: View {
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text("Save")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.blue)
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}


