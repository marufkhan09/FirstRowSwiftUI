//
//  HeaderView.swift
//  Getting Started Swift Chat
//
//  Created by Darryn Campbell on 28/07/2022.
//

import SwiftUI
import PubNub

struct Header: View {
    @ObservedObject var viewModel: ChatViewModel
    @State private var displayMembers: String = ""
    @State private var friendlyNameIsEditable: Bool = false
    @State private var buttonValue: String = "Edit"
    @State private var friendlyNameColor: Color = Color.white
    @State private var friendlyNameBackground: Color = .clear
    @FocusState private var messageIsFocused: Bool
    
    var body: some View {
        
        HStack () {
            VStack(alignment: .leading) {
                HStack {
                    Image(AssetNames.Images.statusBarLogo)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "pencil").resizable().frame(width: 20,height:20).foregroundStyle(.white)
                    }

//                    Button(buttonValue) {
//                        
//                        messageIsFocused = false;
//                        if (buttonValue == "Edit") {
//                            buttonValue = "Save"
//                            friendlyNameColor = .black
//                            friendlyNameBackground = .white
//                            friendlyNameIsEditable = true
//                        }
//                        else {
//                            //  'Save' was pressed
//                            buttonValue = "Edit"
//                            friendlyNameColor = .white
//                            friendlyNameBackground = .clear
//                            friendlyNameIsEditable = false
//                            
//                            if(viewModel.friendlyName == "")
//                            {
//                                viewModel.friendlyName = "default"
//                            }
//                            
//                            //  Mapping of device ID to friendly name.  Master record is PubNub
//                            //  App Context storage
//                            //  See: https://www.pubnub.com/docs/sdks/swift/api-reference/objects
//                            let uuidMetaData = PubNubUUIDMetadataBase(
//                                metadataId: viewModel.deviceId ?? "defaultValue",
//                                name: viewModel.friendlyName
//                            )
//                            viewModel.pubnub?.set(uuid: uuidMetaData) { result in
//                                switch result {
//                                case .success(_):
//                                    print("Metadata successfully set")
//                                case let .failure(error):
//                                    print("Create UUID meta data failed with error: \(error)")
//                                }
//                            }
//                        }
//                    }.padding(3).background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .topLeading)
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom, 10)
        }
        .background(AssetNames.Colors.appbarColor)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ChatViewModel()
        viewModel.memberNames["sim123"] = "Simulator 1"
        viewModel.memberNames["sim124"] = "Simulator 2"
        viewModel.memberNames["sim125"] = "Simulator 3"
        viewModel.groupMemberDeviceIds = ["sim123", "sim124", "sim125"]
        viewModel.friendlyName = "Preview Window"
        return Header(viewModel: viewModel)
    }
}
