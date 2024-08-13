//
//  SpecialDetail.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 13/8/24.
//

import SwiftUI

struct SpecialDetail: View {
    @Environment(\.dismiss) private var dismiss
    @GestureState private var dragOffset: CGSize = .zero
    @EnvironmentObject var settings: AppSettings
    let datum: SpecialData

    var body: some View {
        ScrollView {
            HTMLTextView(
                htmlContent: datum.description,
                maxLines: nil,
                fontSize: 16,
                colorString: settings.isDarkMode ? "white" : "black"
            ).frame(minHeight: 500,maxHeight:10000)
        }
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(AssetNames.Images.arrowleft)
                        .foregroundColor(.white)
                }
            }
        }
        .navigationTitle(datum.title)
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(settings.isDarkMode ? .dark : .light)
        .navigationBarModifier(
            backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0),
            foregroundColor: UIColor.white,
            tintColor: nil,
            withSeparator: false
        )
        .contentShape(Rectangle()) // Makes the whole view responsive to gestures
        .gesture(
            DragGesture()
                .updating($dragOffset, body: { (value, state, _) in
                    state = value.translation
                })
                .onEnded { value in
                    if value.startLocation.x < 50 && value.translation.width > 100 {
                        dismiss()
                    }
                }
        )
    }
}
