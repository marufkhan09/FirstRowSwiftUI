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
        let tintColor: UIColor? = nil
        
        let _ = NavigationBarModifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor, tintColor: tintColor, withSeparator: false)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
                .navigationBarModifier(backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0), foregroundColor: UIColor.white, tintColor: nil, withSeparator: false)
        }
    }
}
