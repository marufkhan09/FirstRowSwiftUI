//
//  ChatView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//
import SwiftUI

struct ChatSegmentView: View {
    @Binding var selectedSegment: Int
    let segments: [ChatSegmentModel]
    
    @Namespace private var namespace // Declare the namespace here

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack(spacing: 16) {
                    ForEach(segments) { segment in
                        VStack {
                            Text(segment.title)
                                .font(.title2)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.clear) // Transparent background
                                .foregroundColor(selectedSegment == segment.id ? .primary : .gray)
                            
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
        }
    }
}

#Preview {
    ChatView()
}
