import SwiftUI

struct HomeView: View {
    @EnvironmentObject var settings: AppSettings
    @State private var games = [
        GamesModel(name: "NFL", imageName: "nfl"),
        GamesModel(name: "NBA", imageName: "nba"),
        GamesModel(name: "MLB", imageName: "mlb"),
        GamesModel(name: "NHL", imageName: "nhl"),
        GamesModel(name: "NCAAF", imageName: "ncaaf"),
        GamesModel(name: "NCAAB", imageName: "ncaab"),
        GamesModel(name: "WNBA", imageName: "wnba"),
        GamesModel(name: "MLS", imageName: "soccer"),
        GamesModel(name: "EPL", imageName: "soccer"),
        GamesModel(name: "LIGUE 1", imageName: "soccer"),
        GamesModel(name: "BUNDESLIGA", imageName: "soccer"),
        GamesModel(name: "LALIGA", imageName: "soccer"),
        GamesModel(name: "SERIA A", imageName: "soccer"),
        GamesModel(name: "UCL", imageName: "soccer"),
        GamesModel(name: "UEL", imageName: "soccer"),
        GamesModel(name: "FIFA", imageName: "soccer")
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
                    GameListView(games: $games, selectedGame: $selectedGame).navigationBarBackButtonHidden()
                }
            }
        }
    }
}


#Preview {
    HomeView().environmentObject(AppSettings())
}
