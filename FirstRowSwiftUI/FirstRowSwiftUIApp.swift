//
//  FirstRowSwiftUIApp.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//

import SwiftUI

@main
struct FirstRowSwiftUIApp: App {
    @StateObject private var settings = AppSettings()
    
    init() {
        setupNavigationBarAppearance()
    }

    func setupNavigationBarAppearance() {
        let backgroundColor = UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0) // RGB for #1D3052
        let foregroundColor = UIColor.white
        let tintColor: UIColor? = UIColor.white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        
        // Customize back button appearance
        let backImage = UIImage(systemName: "star.fill") // Your custom icon
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        appearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: -1000, vertical: 0) // Hides the text

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = tintColor

        // To remove the text, you can also set it explicitly on each UINavigationItem
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
    }


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
                .navigationBarModifier(
                    backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0),
                    foregroundColor: UIColor.white,
                    tintColor: nil,
                    withSeparator: false
                )
        }
    }
}

