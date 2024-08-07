//
//  CustomTabBar.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    let items: [TabBarItem]

    var body: some View {
        HStack {
            ForEach(items, id: \.tag) { item in
                Button(action: {
                    withAnimation {
                        selectedTab = item.tag
                    }
                }) {
                    VStack {
                        Image(item.icon)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: selectedTab == item.tag ? 28 : 22, height: selectedTab == item.tag ? 28 : 22) // Larger size when selected
                            .foregroundColor(selectedTab == item.tag ? Color(AssetNames.Colors.secondaryColor) : Color.gray)
                            .scaleEffect(selectedTab == item.tag ? 1.2 : 1.0) // Animation for scaling effect

                        Text(item.title)
                            .font(.subheadline)
                            .foregroundColor(selectedTab == item.tag ? Color(AssetNames.Colors.secondaryColor) : Color.gray)
                            .opacity(selectedTab == item.tag ? 1.0 : 0.7) // Faded effect for unselected
                            .animation(.easeInOut(duration: 0.2), value: selectedTab) // Animation for opacity change
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity) // Ensure the tab items are evenly spaced
            }
        }
        .background(AssetNames.Colors.primaryColor)
        .shadow(radius: 2) // Optional shadow for better visibility
    }
}






