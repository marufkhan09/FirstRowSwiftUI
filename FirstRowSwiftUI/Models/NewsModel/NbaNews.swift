//
//  NbaNews.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 19/8/24.
//

import Foundation

import Foundation

struct NbaNews: Codable {
    var news: [News]?
    var newsSources: [NewsSource]?

    enum CodingKeys: String, CodingKey {
        case news
        case newsSources
    }

    init(news: [News]? = nil, newsSources: [NewsSource]? = nil) {
        self.news = news
        self.newsSources = newsSources
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.news = try container.decodeIfPresent([News].self, forKey: .news)
        self.newsSources = try container.decodeIfPresent([NewsSource].self, forKey: .newsSources)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(news, forKey: .news)
        try container.encodeIfPresent(newsSources, forKey: .newsSources)
    }
}
