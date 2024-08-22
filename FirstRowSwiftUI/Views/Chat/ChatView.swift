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
    @State private var messages: [ChatMessage] = []
    @State private var messageText: String = ""
    @State private var textFieldHeight: CGFloat = 40 // Initial height

    let segments = [
        ChatSegmentModel(id: 0, title: "ALL"),
        ChatSegmentModel(id: 1, title: "NFL"),
        ChatSegmentModel(id: 2, title: "NBA"),
        ChatSegmentModel(id: 3, title: "MLB"),
        ChatSegmentModel(id: 4, title: "NCAAF"),
        ChatSegmentModel(id: 5, title: "NCAAB"),
        ChatSegmentModel(id: 6, title: "NHL"),
        ChatSegmentModel(id: 7, title: "WNBA"),
        ChatSegmentModel(id: 8, title: "MLS"),
    ]

    var body: some View {
        NavigationStack {
            VStack {
                ChatSegmentView(selectedSegment: $selectedSegment, segments: segments)

                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isUserMessage {
                                    Spacer()
                                    Text(message.content)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                } else {
                                    Text(message.content)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .foregroundColor(.primary)
                                        .cornerRadius(8)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }

                HStack {
                    TextEditor(text: $messageText)
                        .frame(minHeight: textFieldHeight, maxHeight: textFieldHeight)
                        .padding(2)
                        .background(Color.gray.opacity(0.2))
                        .foregroundStyle(.primary)
                        .cornerRadius(2)
                        .onChange(of: messageText) { _,_ in
                            // Adjust the height based on content size
                            adjustTextFieldHeight()
                        }

                    Button(action: {
                        sendMessage()
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(AssetNames.Colors.secondaryColor)
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
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
            .onChange(of: selectedSegment) {oldValue, newValue in
                loadChatRoomMessages(for: segments[newValue].title)
            }
            .onAppear {
                // Initial load for the first chat room
                loadChatRoomMessages(for: segments[selectedSegment].title)
            }
        }
    }

    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        let newMessage = ChatMessage(content: messageText, isUserMessage: true)
        messages.append(newMessage)
        messageText = ""
        
        // Send the message to PubNub here
    }

    private func loadChatRoomMessages(for chatRoom: String) {
        // Clear the current messages
        messages.removeAll()
        
        // Fetch messages for the selected chat room from PubNub or local data
        // Here is where you would load the actual chat messages for the selected chat room
        // For now, we’ll simulate with some dummy data
        
        // Example: Fetch messages from PubNub or your backend based on `chatRoom`
        let fetchedMessages = fetchMessagesFromPubNub(for: chatRoom)
        
        messages = fetchedMessages
    }

    private func fetchMessagesFromPubNub(for chatRoom: String) -> [ChatMessage] {
        // Replace this with your actual PubNub message fetch logic
        // Simulated dummy data:
        return [
            ChatMessage(content: "Welcome to \(chatRoom) chat!", isUserMessage: false),
            ChatMessage(content: "Hello, anyone here?", isUserMessage: true),
        ]
    }
    
    private func adjustTextFieldHeight() {
        let textView = UITextView()
        textView.text = messageText
        let size = textView.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 100, height: CGFloat.infinity))
        textFieldHeight = max(40, min(size.height, 100)) // Adjust height dynamically
    }
}

#Preview {
    ChatView().environmentObject(AppSettings())
}








