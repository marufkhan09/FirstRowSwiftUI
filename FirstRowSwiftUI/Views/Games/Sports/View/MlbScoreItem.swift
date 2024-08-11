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
        GeometryReader { proxy in
          
            VStack (alignment:.center){
                HStack(alignment:.center){
                        VStack {
                            TeamView(team: item.teamsNormalized?.first, score: item.score?.scoreAway, line: item.lines?.first, isHome: false)
                            Spacer().frame(height:16)
                            TeamView(team: item.teamsNormalized?.last, score: item.score?.scoreHome, line: item.lines?.first, isHome: true)
                            Spacer().frame(height:16)
                            
                            
                        }.frame(width:proxy.size.width * 0.6)
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
                        }.frame(width:proxy.size.width * 0.3)
                }
                
                if let message = item.message, !message.isEmpty {
                    Text(message)
                        .foregroundColor(.white)
                        .padding([.leading, .bottom], 12)
                        .background(AssetNames.Colors.primaryColor) // Customize this color
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }.background(AssetNames.Colors.primaryColor).frame(height:180)
        }
    }
}

private func convertTo12HourFormat(_ time: String?) -> String {
    // Implement your time conversion logic here
    return time ?? ""
}


