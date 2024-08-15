//
//  TabViiew.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//

import SwiftUI

struct TabViiew: View {
    @State private var selectedTab: Int = 0

    let tabBarItems = [
        TabBarItem(icon: AssetNames.Images.home, title: "Home", tag: 0),
        TabBarItem(icon: AssetNames.Images.news, title: "News", tag: 1),
        TabBarItem(icon: AssetNames.Images.chat, title: "Chat", tag: 2),
        TabBarItem(icon: AssetNames.Images.special, title: "Special", tag: 3)
    ]

    var body: some View {
        VStack {
            // Main content views
            if selectedTab == 0 {
                HomeView()
            } else if selectedTab == 1 {
                DynamicGrid(items: [])
            } else if selectedTab == 2 {
                ChatView()
            } else {
                SpecialView()
            }

            Spacer()

            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab, items: tabBarItems)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TabViiew().environmentObject(AppSettings())
}
