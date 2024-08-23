//
//  TabViiew.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab: Int = 0
    

    let tabBarItems = [
        TabBarItem(icon: AssetNames.Images.home, title: "Home", tag: 0),
        TabBarItem(icon: AssetNames.Images.news, title: "News", tag: 1),
        TabBarItem(icon: AssetNames.Images.chat, title: "Chat", tag: 2),
        TabBarItem(icon: AssetNames.Images.special, title: "Special", tag: 3)
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Main content views
            Group {
                if selectedTab == 0 {
                    HomeView()
                } else if selectedTab == 1 {
                    NewsView()
                } else if selectedTab == 2 {
                    ChatRedesign()
                } else {
                    SpecialView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // Background for content area

            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab, items: tabBarItems)
                .background(Color.white) // Background color of the tab bar
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    CustomTabView().environmentObject(AppSettings())
}
