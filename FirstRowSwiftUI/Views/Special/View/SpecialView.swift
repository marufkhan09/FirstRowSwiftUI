import SwiftUI

struct SpecialView: View {
    @EnvironmentObject var settings: AppSettings
    @StateObject private var viewModel = SpecialViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack(alignment: .leading, spacing: 0) {
                    // Fixed ZStack at the top
                    ZStack(alignment: .bottom) {
                        AssetNames.Colors.appbarColor
                            .frame(width: geo.size.width, height: 50)
                        
                        // Black background with uneven corners
                        Color.black
                            .frame(width: geo.size.width, height: 40)
                            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 15, topTrailingRadius: 15))
                        
                        Text("Fantasy")
                            .foregroundStyle(.white)
                            .padding(.bottom, 8)
                            .font(.title2)
                    }
                    .padding(.bottom)
                    
                    // Scrollable content
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            if viewModel.isLoading {
                                ProgressView("Loading...")
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            } else if !viewModel.specialData.isEmpty {
                                ForEach(viewModel.specialData) { datum in
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            AsyncImage(url: URL(string: datum.image)) { phase in
                                                switch phase {
                                                case .empty:
                                                    ProgressView()
                                                        .frame(width: 40, height: 40)
                                                        .clipShape(Circle())
                                                case .success(let image):
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 40, height: 40)
                                                        .clipShape(Circle())
                                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                                case .failure:
                                                    Image(systemName: "photo")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 40, height: 40)
                                                        .clipShape(Circle())
                                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                                @unknown default:
                                                    EmptyView()
                                                }
                                            }
                                            Text(datum.title)
                                                .font(.title3)
                                                .foregroundStyle(.white)
                                            Spacer()
                                        }
                                        .padding(.bottom, 5)
                                        
                                        HTMLTextView(
                                            htmlContent: datum.description,
                                            maxLines: 3,
                                            fontSize: 16,
                                            colorString: "white"
                                        )
                                        .frame(height: 60) // Adjust height based on your design
                                        
                                        NavigationLink(destination: SpecialDetail(datum: datum).navigationBarBackButtonHidden()) {
                                            Text("See More")
                                                .font(.subheadline)
                                                .foregroundStyle(.white)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 6)
                                                .background(Color.blue)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                        }
                                        .padding(.top, 5)
                                    }
                                    .padding()
                                    .background(AssetNames.Colors.gameColor)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .padding(.horizontal, 10)
                                }
                            } else {
                                Text("No data available")
                                    .foregroundStyle(.white)
                                    .padding(.top)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(AssetNames.Images.statusBarLogo)
                    }
                }
                .navigationBarModifier(
                    backgroundColor: UIColor(red: 0.114, green: 0.188, blue: 0.322, alpha: 1.0),
                    foregroundColor: UIColor.white,
                    tintColor: nil,
                    withSeparator: false
                )
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}
