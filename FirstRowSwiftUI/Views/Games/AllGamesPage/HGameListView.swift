//
//  HGameListView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI


struct HGameListView: View {
    @Binding var games: [GamesModel]
    @Binding var selectedGame: GamesModel?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(games) { game in
                        VStack(spacing:0) {
                            Image(game.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 38, height: 38)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(game.id == selectedGame?.id ? .blue : Color.black, lineWidth: 1.5)
                                )
                                .padding(.bottom, 2)
                            
                            Text(game.name)
                                .foregroundColor(game.id == selectedGame?.id ? .blue : .white)
                                .fontWeight(game.id == selectedGame?.id ? .bold:.semibold)
                        }
                        .padding(.bottom, 4)
                        .onTapGesture {
                            selectGame(game)
                        }
                        .id(game.id) // Use the game id as the unique identifier for scrolling
                    }
                }
                .padding(.horizontal)
            }
            .onChange(of: selectedGame) { old, new in
                if let selectedGame = new {
                    withAnimation {
                        proxy.scrollTo(selectedGame.id, anchor: .center)
                    }
                }
            }
            
            .onAppear {
                // Scroll to the selected game on appear
                if let selectedGame = selectedGame {
                    withAnimation {
                        proxy.scrollTo(selectedGame.id, anchor: .center)
                    }
                }
            }
        }
    }
    
    private func selectGame(_ game: GamesModel) {
        for index in games.indices {
            games[index].isSelected = (games[index].id == game.id)
        }
        selectedGame = game
    }
}

