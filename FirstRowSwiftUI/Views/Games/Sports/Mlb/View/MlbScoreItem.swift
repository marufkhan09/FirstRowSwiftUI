//
//  ScoreItem.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI

struct MlbScoreItem: View {
    let item: MlbData
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading) {
                    TeamView(team: item.teamsNormalized?.first, score: item.score?.scoreAway, line: item.lines?.first, isHome: false)
                    Spacer().frame(height: 16)
                    TeamView(team: item.teamsNormalized?.last, score: item.score?.scoreHome, line: item.lines?.first, isHome: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(convertTo12HourFormat(item.score?.eventStatusDetail))
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .foregroundColor(.white)
                    Text(item.score?.broadcast ?? "")
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 100, alignment: .trailing)
            }
            .frame(maxWidth: .infinity)
            
            if let message = item.message, !message.isEmpty {
                Text(message)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 12)
            }
            
        }
        .padding()
        .background(AssetNames.Colors.primaryColor)
        .cornerRadius(4)
    }
}

private func convertTo12HourFormat(_ time: String?) -> String {
    // Implement your time conversion logic here
    return time ?? ""
}


