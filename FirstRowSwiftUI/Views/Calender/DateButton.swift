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
    
    private var monthDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d" // Format to show month and day
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            Text(monthDay)
                .font(.headline)
                .foregroundColor(isSelected ? .blue : .white)
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
//    DateButton(date: Date(), isSelected: false, action: {})
//}
