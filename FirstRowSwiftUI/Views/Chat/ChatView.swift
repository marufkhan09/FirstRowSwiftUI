//
//  ChatView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 22/8/24.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var settings: AppSettings
    @State private var selectedSegment = 0
    let segments = [
        ChatSegmentModel(id: 0, title: "NFL"),
        ChatSegmentModel(id: 1, title: "NBA"),
        ChatSegmentModel(id: 2, title: "MLB"),
        ChatSegmentModel(id: 3, title: "NCAAF"),
        ChatSegmentModel(id: 4, title: "NCAAB"),
        ChatSegmentModel(id: 2, title: "NHL"),
        ChatSegmentModel(id: 3, title: "WNBA"),
        ChatSegmentModel(id: 4, title: "MLS"),
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                VStack {
                    ChatSegmentView(selectedSegment: $selectedSegment, segments: segments)
                    
                    Spacer()
                    
                    Text("Selected Segment: \(segments[selectedSegment].title)")
                        .font(.largeTitle)
                        .padding()
                    
                    Spacer()
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
        }
    }
}

#Preview {
    ChatView().environmentObject(AppSettings())
}
