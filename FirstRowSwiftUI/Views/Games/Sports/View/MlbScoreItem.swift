//
//  MlbScoreItem.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI

struct MlbScoreItem: View {
    let item: MlbData
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    
                    // Team Details View
                    TeamView(team: item.teamsNormalized?.first, score: item.score?.scoreAway, line: item.lines?.first, isHome: false)
                    
                    Spacer()
                    
                    TeamView(team: item.teamsNormalized?.last, score: item.score?.scoreHome, line: item.lines?.first, isHome: true)
                    
                    // Customize this color
                    
                    if let message = item.message, !message.isEmpty {
                        Text(message)
                            .padding([.leading, .bottom], 12)
                            .background(AssetNames.Colors.primaryColor) // Customize this color
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(12)
                .background(AssetNames.Colors.primaryColor)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(convertTo12HourFormat(item.score?.eventStatusDetail))
                        .lineLimit(3)
                        .truncationMode(.tail)
                    
                    Text(item.score?.broadcast ?? "")
                        .lineLimit(2)
                        .truncationMode(.tail)
                }
                .padding(.trailing, 12)
            }
        }
    }
}


private func convertTo12HourFormat(_ time: String?) -> String {
    // Implement your time conversion logic here
    return time ?? ""
}



