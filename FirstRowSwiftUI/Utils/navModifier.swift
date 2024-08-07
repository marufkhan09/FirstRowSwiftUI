//
//  navModifier.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//
import SwiftUI
import UIKit


// Modifier for setting up the navigation bar appearance
struct NavigationBarModifier: ViewModifier {
    
    init(backgroundColor: UIColor = .systemBackground, foregroundColor: UIColor = .blue, tintColor: UIColor? = nil, withSeparator: Bool = true) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        navBarAppearance.backgroundColor = backgroundColor
        if !withSeparator {
            navBarAppearance.shadowColor = .clear
        }
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        if let tintColor = tintColor {
            UINavigationBar.appearance().tintColor = tintColor
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarModifier(backgroundColor: UIColor = .systemBackground, foregroundColor: UIColor = .label, tintColor: UIColor? = nil, withSeparator: Bool = true) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor, tintColor: tintColor, withSeparator: withSeparator))
    }
}

// A preview to see your modifier is a way to apply it to the original struct.
#Preview {
    NavigationStack {
        Text("My Text Text")
         // To display our modifier in the preview or in your view is a way to see its effect.
        //.modifier(NavigationBarModifier(backgroundColor: .systemBackground, foregroundColor: .blue, tintColor: nil, withSeparator: false))
            .navigationTitle("Test title")
            .navigationBarModifier(backgroundColor: .systemTeal, foregroundColor: .systemBlue, tintColor: nil, withSeparator: true)
        
            
    }
}


