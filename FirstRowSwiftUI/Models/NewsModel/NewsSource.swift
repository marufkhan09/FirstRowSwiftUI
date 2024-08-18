//
//  NewsSource.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 19/8/24.
//

import Foundation

struct NewsSource: Codable {
    var id: Int?
    var imageVersion: Int?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageVersion
        case name
    }

    init(id: Int? = nil, imageVersion: Int? = nil, name: String? = nil) {
        self.id = id
        self.imageVersion = imageVersion
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.imageVersion = try container.decodeIfPresent(Int.self, forKey: .imageVersion)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(imageVersion, forKey: .imageVersion)
        try container.encodeIfPresent(name, forKey: .name)
    }
}
