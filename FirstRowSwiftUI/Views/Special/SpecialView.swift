//
//  SpecialView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//

import SwiftUI

struct SpecialView: View {
    @EnvironmentObject var settings: AppSettings
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        ZStack(alignment:.bottom) {
                            AssetNames.Colors.appbarColor
                                .frame(width: geo.size.width, height: 50)
                            
                            // Black background with uneven corners
                            Color.black
                                .frame(width: geo.size.width, height: 40)
                                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 15, topTrailingRadius: 15))
                            
                            Text("Fantasy").foregroundStyle(.white).padding(.bottom,8).font(.title2)
                        }
                    }
                }.toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(AssetNames.Images.statusBarLogo)
                    }
                }
                
                .navigationBarModifier(
                    backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0),
                    foregroundColor: UIColor.white,
                    tintColor: nil,
                    withSeparator: false
                )
            }
        }
    }
}

#Preview {
    SpecialView().environmentObject(AppSettings())
}
