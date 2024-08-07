import SwiftUI



// Main view
struct HomeView: View {
    @EnvironmentObject var settings: AppSettings
    @State private var games = [
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
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(games) { game in
                        
                        
                        HStack {
                            Image(game.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40) // Adjust size as needed
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1)) // Optional border
                            
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
                        .background(AssetNames.Colors.gameColor) // Background color for each row
                        .cornerRadius(4)
                        
                        
                        
                    }
                }
                .background(settings.isDarkMode ? Color.black.ignoresSafeArea() : Color.white.ignoresSafeArea()) // Background color for the entire view
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(AssetNames.Images.statusBarLogo) // Replace with your actual image
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        settings.isDarkMode.toggle() // Toggle between dark and light mode
                    }) {
                        Image(systemName: settings.isDarkMode ? "moon.fill" : "sun.max.fill")
                    }
                }
            }
            .navigationBarModifier(
                backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0), // RGB for #1D3052
                foregroundColor: UIColor.white,
                tintColor: nil,
                withSeparator: false
            )
            .preferredColorScheme(settings.isDarkMode ? .dark : .light) // Apply the selected color scheme
        }
    }
}

#Preview {
    HomeView().environmentObject(AppSettings())
}
