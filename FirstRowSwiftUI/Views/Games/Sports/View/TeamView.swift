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
        VStack(alignment:.leading) {
            HStack(alignment:.center) {
                Circle()
                    .fill(AssetNames.Colors.secondaryColor) // Customize this color
                    .frame(width: 26, height: 26)
                    .overlay(Text(isHome ? "H" : "A")
                        .font(.title3)
                        .foregroundColor(.white))
                
                Text(team?.abbreviation ?? "")
                    .font(.title3)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Spacer()
                
                Text(moneylineText)
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(width: 80, alignment: .center)
                
                Text("\(score ?? 0)")
                    .font(.title3)
                    .foregroundColor(.white)
            }
        }
    }
    
    private var moneylineText: String {
        if let moneyline = line?.moneyline {
            return isHome ? String(format: "%.0f", moneyline.moneylineHome ?? 0.0) : String(format: "%.0f", moneyline.moneylineAway ?? 0.0)
        }
        return "--"
    }
}




