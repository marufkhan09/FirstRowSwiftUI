//
//  ChatMessage.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 22/8/24.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let content: String
    let isUserMessage: Bool
}
