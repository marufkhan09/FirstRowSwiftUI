//
//  MlbGameList.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI

struct MlbGamesList: View {
    @StateObject private var viewModel = MlbViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                if viewModel.mlbEventLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    if viewModel.mlbGameData.isEmpty {
                        Text("No Data Available")
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ForEach(viewModel.mlbGameData) { item in
                            MlbScoreItem(item: item)
                                .padding(.vertical, 5)
                                .onTapGesture {
                                    // Handle tap action if needed
                                }
                        }
                    }
                    
                }
            }
        } .scrollIndicators(.hidden)
            .onAppear {
                // Load data when view appears
                
                viewModel.fetchMlbData()
                
            }
    }
}

struct MlbGamesList_Previews: PreviewProvider {
    static var previews: some View {
        MlbGamesList()
    }
}
