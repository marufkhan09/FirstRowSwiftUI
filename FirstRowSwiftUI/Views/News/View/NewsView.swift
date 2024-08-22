import SwiftUI
import WebKit

struct NewsView: View {
    @EnvironmentObject var settings: AppSettings
    @StateObject private var viewModel = NewsViewModel()
    
    
    private let pattern: [CardSize] = [.full, .hhalf, .full, .vhhalf]
    
    
    var body: some View {
        NavigationView {  // Add a NavigationView here
            ScrollView { 
                if viewModel.isLoading {
                    
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity).padding(.top)
                }
                else if !viewModel.nbaNewsList.isEmpty {
                    LazyVStack(spacing: 2) {
                        ForEach(0..<itemGroups.count, id: \.self) { index in
                            let itemGroup = itemGroups[index]
                            
                            switch itemGroup.size {
                            case .full:
                                NewsCardView(item: itemGroup.items[0], size: .full)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                                
                            case .hhalf:
                                HStack(spacing: 2) {
                                    NewsCardView(item: itemGroup.items[0], size: .hhalf)
                                        .clipped()
                                    
                                    if itemGroup.items.count > 1 {
                                        NewsCardView(item: itemGroup.items[1], size: .hhalf)
                                            .clipped()
                                    }
                                }
                                
                            case .vhhalf:
                                HStack(spacing: 2) {
                                    if itemGroup.items.count > 0 {
                                        NewsCardView(item: itemGroup.items[0], size: .vhhalf)
                                            .frame(width: UIScreen.main.bounds.width / 2, height: 240)
                                            .clipped()
                                    }
                                    
                                    VStack(spacing: 2) {
                                        if itemGroup.items.count > 1 {
                                            NewsCardView(item: itemGroup.items[1], size: .vhhalf)
                                                .frame(width: UIScreen.main.bounds.width / 2, height: 120)
                                                .clipped()
                                        }
                                        
                                        if itemGroup.items.count > 2 {
                                            NewsCardView(item: itemGroup.items[2], size: .vhhalf)
                                                .frame(width: UIScreen.main.bounds.width / 2, height: 120)
                                                .clipped()
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    Text("No data available")
                        .foregroundStyle(.white)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                
            }
            .scrollIndicators(.hidden)
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
            .onAppear {
                viewModel.getNBANews()
            }
        }
    }
    
    // Computed property to group items according to the pattern
    private var itemGroups: [(size: CardSize, items: [News])] {
        var result: [(size: CardSize, items: [News])] = []
        var index = 0
        
        while index < viewModel.nbaNewsList.count {
            let patternIndex = result.count % pattern.count
            let cardSize = pattern[patternIndex]
            
            switch cardSize {
            case .full:
                if index < viewModel.nbaNewsList.count {
                    result.append((size: .full, items: [viewModel.nbaNewsList[index]]))
                    index += 1
                }
                
            case .hhalf:
                if index < viewModel.nbaNewsList.count {
                    let end = min(index + 2, viewModel.nbaNewsList.count)
                    result.append((size: .hhalf, items: Array(viewModel.nbaNewsList[index..<end])))
                    index = end
                }
                
            case .vhhalf:
                if index < viewModel.nbaNewsList.count {
                    let end = min(index + 3, viewModel.nbaNewsList.count)
                    result.append((size: .vhhalf, items: Array(viewModel.nbaNewsList[index..<end])))
                    index = end
                }
            }
        }
        
        return result
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .previewLayout(.sizeThatFits)
            .environmentObject(AppSettings())
    }
}




enum CardSize {
    case full
    case hhalf
    case vhhalf
    
    var maxWidth: CGFloat {
        switch self {
        case .full:
            return .infinity
        case .hhalf, .vhhalf:
            return UIScreen.main.bounds.width / 2
        }
    }
    
    var maxHeight: CGFloat {
        switch self {
        case .full:
            return 240
        case .hhalf:
            return 240
        case .vhhalf:
            return 240
        }
    }
}
