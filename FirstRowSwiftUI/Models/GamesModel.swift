//
//  GamesModel.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//
import SwiftUI

struct GamesModel: Identifiable {
    let id = UUID() // or any other unique identifier
    let name: String
    let imageName: String
    var isSelected: Bool = false
}


