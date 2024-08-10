//
//  HGameView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI


struct HGameView: View {
    @Binding var games: [GamesModel]
    @Binding var selectedGame: GamesModel?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(games) { game in
                        VStack {
                            Image(game.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(game.id == selectedGame?.id ? Color.blue : Color.black, lineWidth: 2)
                                )
                                .padding(.bottom, 2)
                            
                            Text(game.name)
                                .foregroundColor(game.id == selectedGame?.id ? .blue : .white)
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
            .onChange(of: selectedGame) { newValue in
                if let selectedGame = newValue {
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

