//
//  ChatViewModel.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 22/8/24.
//

import Foundation
import PubNub

//  Viewmodel for the chat view (i.e. the whole application).
//  Also holds application state, e.g the PubNub object
class ChatViewModel: ObservableObject {
    @Published var messages: Array<Message> = Array()
    @Published var heading: String = "Group Chat"
    @Published var groupMemberDeviceIds: Array<String> = Array()
    @Published var memberNames = [String : String]()
    @Published var friendlyName: String = ""
    var pubnub: PubNub? = nil
    var listener: SubscriptionListener? = nil
    var objectsListener: SubscriptionListener? = nil
    var deviceId: String? = nil
    var channel: String? = nil
    
    func resolveFriendlyName(deviceId: String) -> String
    {
        if (memberNames.keys.contains(deviceId)) {
            return memberNames[deviceId] ?? "defaultId"
        }
        else {
            return deviceId
        }
    }
}
