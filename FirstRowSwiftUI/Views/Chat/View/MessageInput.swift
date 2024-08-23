//
//  MessageInput.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 23/8/24.
//


import SwiftUI

struct MessageInput: View {
    @ObservedObject var viewModel: ChatViewModel
    @State private var messageText: String = ""
    @FocusState private var messageIsFocused: Bool
    @EnvironmentObject var settings: AppSettings
    private func adjustTextFieldHeight() {
        let textView = UITextView()
        textView.text = messageText
        let size = textView.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 100, height: CGFloat.infinity))
        textFieldHeight = max(40, min(size.height, 100)) // Adjust height dynamically
    }
    @State private var textFieldHeight: CGFloat = 44
    
    var body: some View {
        HStack(spacing:10) {
            TextField("", text: $messageText)
                .focused($messageIsFocused)
                .disableAutocorrection(true)
                .frame(minWidth: textFieldHeight, minHeight: textFieldHeight)
                .padding(.horizontal)
                .background(AssetNames.Colors.appbarColor)
                .foregroundColor(.white)
                .cornerRadius(2)
                .overlay(
                    Group {
                        if messageText.isEmpty {
                            Text("Message")
                                .foregroundColor(.gray) // Placeholder color
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .frame(minWidth: textFieldHeight, minHeight: textFieldHeight)
                                .cornerRadius(2)
                        }
                    }, alignment: .leading
                )
                .onChange(of: messageText) { _, _ in
                    adjustTextFieldHeight()
                }


                Button(action: {
                    print("Button pressed " + messageText)
                    messageIsFocused = false;
                    if(messageText == "")
                    {
                        return;
                    }
                    viewModel.pubnub?.publish(
                        channel: viewModel.channel ?? "default_channel",
                        message: messageText,
                        shouldStore: true
                    ) { result in
                        switch result {
                        case .success(_):
                            //  Message successfully sent
                            break;
                        case let .failure(error):
                            print("publish failed: \(error.localizedDescription)")
                        }
                    }
                    messageText = ""
                }) {
                    Image(systemName: "paperplane.fill").frame(width:44,height:44).foregroundColor(.white).background(AssetNames.Colors.secondaryColor).clipShape(RoundedRectangle(cornerRadius: 4))
                        
                       
                }
            }
            .padding(.horizontal,10).padding(.vertical,8)
            .preferredColorScheme(settings.isDarkMode ? .dark : .light)
            .background(Color(UIColor.systemBackground))
        
       
    }
}

struct MessageInput_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ChatViewModel()
        MessageInput(viewModel: viewModel).environmentObject(AppSettings())
    }
}
