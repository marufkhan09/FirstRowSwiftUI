//
//  Message.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 22/8/24.
//

import Foundation

//  Represents a messages, used in the viewModel to display messages
struct Message: Hashable {
    var message: String = ""
    var senderDeviceId: String = ""
    var timetoken: String = ""
    var humanReadableTime: String = ""
}

