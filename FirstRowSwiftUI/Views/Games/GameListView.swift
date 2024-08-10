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
                                            .scaledToFill()
                                            .frame(width: 40, height: 40).clipShape(Circle())
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
                    
                    HStack(spacing:10) {
                        Button {
                            dismiss.callAsFunction()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                        Image(AssetNames.Images.statusBarLogo)
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
        GamesModel(name: "NFL", imageName: AssetNames.Images.nfl),
        GamesModel(name: "NBA", imageName: AssetNames.Images.nba),
        GamesModel(name: "MLB", imageName: AssetNames.Images.mlb),
        GamesModel(name: "NHL", imageName: AssetNames.Images.nhl),
        GamesModel(name: "NCAAF", imageName: AssetNames.Images.ncaaf),
        GamesModel(name: "NCAAB", imageName: AssetNames.Images.ncaab),
        GamesModel(name: "WNBA", imageName: AssetNames.Images.wnba),
        GamesModel(name: "MLS", imageName: AssetNames.Images.mls),
        GamesModel(name: "EPL", imageName: AssetNames.Images.epl),
        GamesModel(name: "LIGUE 1", imageName: AssetNames.Images.ligue1),
        GamesModel(name: "BUNDESLIGA", imageName:AssetNames.Images.bundesliga),
        GamesModel(name: "LALIGA", imageName: AssetNames.Images.laliga),
        GamesModel(name: "SERIA A", imageName: AssetNames.Images.seriaa),
        GamesModel(name: "UCL", imageName: AssetNames.Images.ucl),
        GamesModel(name: "UEL", imageName: AssetNames.Images.uel),
        GamesModel(name: "FIFA", imageName: AssetNames.Images.fifa)
    ]), selectedGame: .constant(GamesModel(name: "NFL", imageName: AssetNames.Images.nfl)))
                 }
