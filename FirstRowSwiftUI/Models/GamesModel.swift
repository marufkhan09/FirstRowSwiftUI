//
//  GamesModel.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//
import SwiftUI

struct GamesModel: Identifiable, Equatable {
    var id: UUID = UUID()
    var name: String
    var imageName: String
    var isSelected: Bool = false
    
    // Conform to Equatable by implementing == operator
    static func == (lhs: GamesModel, rhs: GamesModel) -> Bool {
        return lhs.id == rhs.id
    }
}



