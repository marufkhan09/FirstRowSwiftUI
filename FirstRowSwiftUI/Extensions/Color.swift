//
//  Color.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//

import SwiftUI



extension Color {
    init(hex: String, alpha: Double = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        let scanner = Scanner(string: hexSanitized)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let r, g, b, a: Double
        switch hexSanitized.count {
        case 6: // RGB (24-bit)
            r = Double((color >> 16) & 0xFF) / 255.0
            g = Double((color >> 8) & 0xFF) / 255.0
            b = Double(color & 0xFF) / 255.0
            a = alpha
        case 8: // ARGB (32-bit)
            r = Double((color >> 16) & 0xFF) / 255.0
            g = Double((color >> 8) & 0xFF) / 255.0
            b = Double(color & 0xFF) / 255.0
            a = Double((color >> 24) & 0xFF) / 255.0
        default:
            r = 0.0
            g = 0.0
            b = 0.0
            a = 1.0
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}

