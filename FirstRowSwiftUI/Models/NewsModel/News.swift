//
//  NewsModel.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 15/8/24.
//
import Foundation

struct News: Codable {
    var id: Int?
    var image: String?
    var isMagazine: Bool?
    var publishDate: String?
    var sourceId: Int?
    var title: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case image
        case isMagazine
        case publishDate
        case sourceId
        case title
        case url
    }

    init(id: Int? = nil,
         image: String? = nil,
         isMagazine: Bool? = nil,
         publishDate: String? = nil,
         sourceId: Int? = nil,
         title: String? = nil,
         url: String? = nil) {
        self.id = id
        self.image = image
        self.isMagazine = isMagazine
        self.publishDate = publishDate
        self.sourceId = sourceId
        self.title = title
        self.url = url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.isMagazine = try container.decodeIfPresent(Bool.self, forKey: .isMagazine)
        self.publishDate = try container.decodeIfPresent(String.self, forKey: .publishDate)
        self.sourceId = try container.decodeIfPresent(Int.self, forKey: .sourceId)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(isMagazine, forKey: .isMagazine)
        try container.encodeIfPresent(publishDate, forKey: .publishDate)
        try container.encodeIfPresent(sourceId, forKey: .sourceId)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(url, forKey: .url)
    }
}
