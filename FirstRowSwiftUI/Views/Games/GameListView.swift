import SwiftUI

struct GameListView: View {
    @Binding var games: [GamesModel]
    @Binding var selectedGame: GamesModel?
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var settings: AppSettings
    var body: some View {
        GeometryReader { geo in
            VStack(alignment:.leading,spacing: 0) {
                ZStack(alignment: .bottom) {
                    // Blue background
                    AssetNames.Colors.appbarColor
                        .frame(width: geo.size.width, height: 75)
                    
                    // Black background with uneven corners
                    Color.black
                        .frame(width: geo.size.width, height: 55)
                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 15, topTrailingRadius: 15))
                    
                    // Horizontal ScrollView for games
                    HGameView(games: $games, selectedGame: $selectedGame)
                }
                
                // Display the selected game's name
                if let selectedGame = selectedGame {
                    if( selectedGame.name == "MLB"){
                        MlbView()
                    }else {
                        Text("Selected Game: \(selectedGame.name)")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                    }
                    
                    
                } else {
                    Text("No Game Selected")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 10) {
                        Button {
                            dismiss()
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
            ).preferredColorScheme(settings.isDarkMode ? .dark : .light)
            
        }
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
    ]), selectedGame: .constant(GamesModel(name: "NFL", imageName: AssetNames.Images.nfl))).environmentObject(AppSettings())
}
