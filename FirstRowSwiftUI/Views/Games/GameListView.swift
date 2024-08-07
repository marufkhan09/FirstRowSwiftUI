import SwiftUI

struct GameListView: View {
    @Binding var games: [GamesModel]
    @Binding var selectedGame: GamesModel?
    @Environment(\.dismiss) private var dismiss
    @State private var scrollViewProxy: ScrollViewProxy?
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment:.bottom) {
                    // Blue background
                    AssetNames.Colors.appbarColor
                    
                        .frame(width: geo.size.width, height: 110)
                    
                    // Black background with uneven corners
                    Color.black
                        .frame(width: geo.size.width, height: 70)
                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 15, topTrailingRadius: 15))
                    
                    // Horizontal ScrollView for games
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(games) { game in
                                    VStack {
                                        Image(game.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Circle()
                                                    .stroke(game.id == selectedGame?.id ? Color.blue : Color.black, lineWidth: 2)
                                            )
                                            .padding(.bottom, 4)
                                        
                                        Text(game.name)
                                            .foregroundColor(game.id == selectedGame?.id ? .blue : .white)
                                    }
                                    .padding()
                                    
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
                            scrollViewProxy = proxy
                            // Scroll to the selected game on appear
                            if let selectedGame = selectedGame {
                                withAnimation {
                                    proxy.scrollTo(selectedGame.id, anchor: .center)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            } .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {

                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }

                }
                
             
            }
            .navigationBarModifier(
                backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0),
                foregroundColor: UIColor.white,
                tintColor: nil,
                withSeparator: false
            )
          
        }
    }
    
    private func selectGame(_ game: GamesModel) {
        for index in games.indices {
            games[index].isSelected = (games[index].id == game.id)
        }
        selectedGame = game
    }
}

#Preview {
    GameListView(games: .constant([
        GamesModel(name: "NFL", imageName: "football"),
        GamesModel(name: "NBA", imageName: "basketball"),
        GamesModel(name: "MLB", imageName: "baseball"),
        GamesModel(name: "NHL", imageName: "hockey"),
        GamesModel(name: "NCAAF", imageName: "college_football"),
        GamesModel(name: "NCAAB", imageName: "college_basketball"),
        GamesModel(name: "WNBA", imageName: "women_basketball"),
        GamesModel(name: "MLS", imageName: "soccer"),
        GamesModel(name: "EPL", imageName: "soccer"),
        GamesModel(name: "LIGUE 1", imageName: "soccer"),
        GamesModel(name: "BUNDESLIGA", imageName: "soccer"),
        GamesModel(name: "LALIGA", imageName: "soccer"),
        GamesModel(name: "SERIA A", imageName: "soccer"),
        GamesModel(name: "UCL", imageName: "soccer"),
        GamesModel(name: "UEL", imageName: "soccer"),
        GamesModel(name: "FIFA", imageName: "soccer")
    ]), selectedGame: .constant(GamesModel(name: "NFL", imageName: "football")))
}
