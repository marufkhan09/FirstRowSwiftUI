//
//  DateButton.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//

import SwiftUI

import UIKit

struct DateButton: View {
    var date: Date
    var isSelected: Bool
    var action: () -> Void
    
    private var day: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    private var dayOfWeek: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.caption)
                .foregroundColor(isSelected ? .blue : .primary)
            
            Text(day)
                .font(.headline)
                .foregroundColor(isSelected ? .blue : .primary)
        }
        .onTapGesture {
            // Trigger haptic feedback
            let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
            impactFeedbackGenerator.impactOccurred()
            
            // Perform the action
            action()
        }
    }
}

//#Preview {
//    DateButton()
//}
