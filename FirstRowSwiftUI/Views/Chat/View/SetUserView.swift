//
//  SetUserView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 22/8/24.
//
import SwiftUI
import PubNub

struct SetUserView: View {
    @EnvironmentObject var settings: AppSettings
    @StateObject private var sviewModel = SpecialViewModel()
    @StateObject var viewModel: ChatViewModel
    @State private var displayMembers: String = ""
    @State private var friendlyNameIsEditable: Bool = false
    @State private var buttonValue: String = "Edit"
    @State private var friendlyNameColor: Color = Color.white
    @State private var friendlyNameBackground: Color = .clear
    @FocusState private var messageIsFocused: Bool
    @State private var messageText: String = ""

    var body: some View {
    
           
               

            VStack(spacing: 8) {
                TextField("", text: $messageText)
                    .placeholder(when: messageText.isEmpty) {
                        Text("Enter your username").foregroundColor(Color.gray)
                    }
                    .padding()
                    .frame(height: 54)
                    .background(AssetNames.Colors.gameColor)
                    .foregroundColor(.white) // Sets the text color to white
                    .cornerRadius(8)
                    .padding(.horizontal)

                TextField("NOT YET DEFINED", text: $viewModel.friendlyName)
                    .disabled(!friendlyNameIsEditable)
                    .foregroundColor(friendlyNameColor)
                    .background(friendlyNameBackground)
                    .focused($messageIsFocused)

                SaveButton {
                    messageIsFocused = false
                    if buttonValue == "Edit" {
                        buttonValue = "Save"
                        friendlyNameColor = .black
                        friendlyNameBackground = .white
                        friendlyNameIsEditable = true
                    } else {
                        buttonValue = "Edit"
                        friendlyNameColor = .white
                        friendlyNameBackground = .clear
                        friendlyNameIsEditable = false

                        if viewModel.friendlyName.isEmpty {
                            viewModel.friendlyName = "default"
                        }

                        let uuidMetaData = PubNubUUIDMetadataBase(
                            metadataId: viewModel.deviceId ?? "defaultValue",
                            name: viewModel.friendlyName
                        )
                        viewModel.pubnub?.set(uuid: uuidMetaData) { result in
                            switch result {
                            case .success(_):
                                print("Metadata successfully set")
                            case let .failure(error):
                                print("Create UUID meta data failed with error: \(error)")
                            }
                        }
                    }
                }
            
        }
        
        .background( Image("setuser")
            .resizable()
            .scaledToFill())
    }
}


struct SetUserView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ChatViewModel()
        viewModel.memberNames["sim123"] = "Simulator 1"
        viewModel.memberNames["sim124"] = "Simulator 2"
        viewModel.memberNames["sim125"] = "Simulator 3"
        viewModel.groupMemberDeviceIds = ["sim123", "sim124", "sim125"]
        viewModel.friendlyName = "Preview Window"
        return SetUserView(viewModel: viewModel)
    }
}



extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
