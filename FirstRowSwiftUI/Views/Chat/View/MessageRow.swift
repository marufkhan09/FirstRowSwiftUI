//
//  MessageRow.swift
//  Getting Started Swift Chat
//
//  Created by Darryn Campbell on 26/07/2022.
//

import SwiftUI

struct MessageRow: View {
    var message: Message
    @ObservedObject var viewModel: ChatViewModel
    
    func getFirstLetter(from string: String) -> String? {
        guard let firstCharacter = string.first else {
            return nil
        }
        return String(firstCharacter.uppercased())
    }

    
    var body: some View {
        HStack (alignment:.top){
            ZStack {
                Color.blue.clipShape(Circle())
                Text(getFirstLetter(from:message.senderDeviceId)!).foregroundStyle(.white)
            }.frame(width: 40,height: 40)
            VStack (alignment: .leading){
                Text(self.viewModel.resolveFriendlyName(deviceId: message.senderDeviceId )).fontWeight(.bold)
                Text(message.message).fontWeight(.light)
                Text(message.humanReadableTime).font(.footnote).frame(maxWidth: .infinity, alignment: .trailing).foregroundColor(Color.gray)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity)
            Spacer()
        }
    }
}


struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ChatViewModel()
        let message = Message(message: "Test Message", senderDeviceId: "Simulator 1", timetoken: "16590086742278148", humanReadableTime: "Jul 28, 2022 at 12:44:34 PM")
        MessageRow(message: message, viewModel: viewModel)
            .previewLayout(.fixed(width: 300, height: 70))
        
    }
}

