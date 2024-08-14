//
//  NewsModel.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 15/8/24.
//

import SwiftUI

struct NewsItem: Identifiable, Hashable {
    let id: Int
    let image: String?
    let isMagazine: Bool?
    let publishDate: String?
    let sourceId: Int?
    let title: String?
    let url: String?
    
    // Implement Hashable protocol using only the id
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: NewsItem, rhs: NewsItem) -> Bool {
        return lhs.id == rhs.id
    }
}

