//
//  ChatSegmentView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//
import SwiftUI

struct ChatSegmentView: View {
    @Binding var selectedSegment: Int
    let segments: [ChatSegmentModel]
    @EnvironmentObject var settings: AppSettings
    
    @Namespace private var namespace // Declare the namespace here

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack(spacing: 16) {
                    ForEach(segments) { segment in
                        VStack(spacing:0) {
                            Text(segment.title)
                                .font(.title2).fontWeight(selectedSegment == segment.id ?.semibold: .regular)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.clear) // Transparent background
                                .foregroundColor(selectedSegment == segment.id ? AssetNames.Colors.secondaryColor : .gray)
                            
                            // Bottom underline
                            if selectedSegment == segment.id {
                                Capsule()
                                    .fill(AssetNames.Colors.secondaryColor)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "underline", in: namespace)
                            } else {
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(height: 4)
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedSegment = segment.id
                                proxy.scrollTo(segment.id, anchor: .center) // Center the selected item
                            }
                        }
                    }
                }
                .padding(.horizontal,8)
            }
           
        }.preferredColorScheme(settings.isDarkMode ? .dark : .light)
            .background(Color(UIColor.systemBackground))
    }
}

#Preview {
    ChatRedesign().environmentObject(AppSettings())
}
