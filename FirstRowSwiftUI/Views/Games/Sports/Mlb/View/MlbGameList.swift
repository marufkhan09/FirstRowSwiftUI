//
//  MlbGameList.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI

struct MlbGamesList: View {
    @ObservedObject var viewModel: MlbViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 10) {
                if viewModel.mlbEventLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    if viewModel.mlbGameData.isEmpty {
                        Text("No Data Available")
                            .font(.title)
                            .foregroundColor(.primary)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        ForEach(viewModel.mlbGameData) { item in
                            MlbScoreItem(item: item)
                        }
                    }
                }
            }
            
        }
        .scrollIndicators(.hidden)
    }
}

private func convertTo12HourFormat(_ time: String?) -> String {
    // Implement your time conversion logic here
    return time ?? ""
}


