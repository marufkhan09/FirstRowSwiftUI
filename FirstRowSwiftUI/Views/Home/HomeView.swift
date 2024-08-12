import SwiftUI

struct HomeView: View {
    @EnvironmentObject var settings: AppSettings
    @State private var games = [
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
    ]
    
    @State private var selectedGame: GamesModel? = nil
    @State private var isShowingGameList = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(games) { game in
                        HStack {
                            Image(game.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            
                            Text(game.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(AssetNames.Colors.gameColor)
                        .cornerRadius(4)
                        .onTapGesture {
                            selectedGame = game
                            isShowingGameList = true
                        }
                    }
                }
                .background(settings.isDarkMode ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea())
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(AssetNames.Images.statusBarLogo)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        settings.isDarkMode.toggle()
                    }) {
                        Image(systemName: settings.isDarkMode ? "moon.fill" : "sun.max.fill")
                    }
                }
            }
            .navigationBarModifier(
                backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0),
                foregroundColor: UIColor.white,
                tintColor: nil,
                withSeparator: false
            )
            .preferredColorScheme(settings.isDarkMode ? .dark : .light)
            .navigationDestination(isPresented: $isShowingGameList) {
                if selectedGame != nil {
                    AllGames(games: $games, selectedGame: $selectedGame).navigationBarBackButtonHidden()
                }
            }
        }
    }
}


#Preview {
    HomeView().environmentObject(AppSettings())
}
