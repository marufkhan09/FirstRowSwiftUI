//
//  TeamView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI

struct TeamView: View {
    let team: TeamsNormalized?
    let score: Int?
    let line: Line?
    let isHome: Bool
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(AssetNames.Colors.secondaryColor) // Customize this color
                    .frame(width: 20, height: 20)
                    .overlay(Text(isHome ? "H" : "A")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white))
                
                Text(team?.abbreviation ?? "")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Spacer()
                
                Text(moneylineText)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 80, alignment: .center)
                
                Text("\(score ?? 0)")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 10)
        }
    }
    
    private var moneylineText: String {
        if let moneyline = line?.moneyline {
            return isHome ? String(format: "%.0f", moneyline.moneylineHome ?? 0.0) : String(format: "%.0f", moneyline.moneylineAway ?? 0.0)
        }
        return "--"
    }
}


