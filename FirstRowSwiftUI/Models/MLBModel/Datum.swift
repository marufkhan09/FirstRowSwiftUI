// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let datum = try? newJSONDecoder().decode(Datum.self, from: jsonData)

import Foundation

// MARK: - Datum
class MlbData: Identifiable, Codable {
    var id: Int?
    var name: String?
    var isPick: Bool?
    var url: String?
    var teamsNormalized: [TeamsNormalized]?
    var lines: [Line]?
    var message: String?
    var score: Score?

    enum CodingKeys: String, CodingKey {
        case id, name
        case isPick = "is_pick"
        case url
        case teamsNormalized = "teams_normalized"
        case lines, message
        case score
    }
    
    init(id: Int? = 0, name: String? = "", isPick: Bool? = false, url: String? = "", teamsNormalized: [TeamsNormalized]? = [], lines: [Line]? = [], message: String? = "", score: Score? = Score()) {
        self.id = id
        self.name = name
        self.isPick = isPick
        self.url = url
        self.teamsNormalized = teamsNormalized
        self.lines = lines
        self.message = message
        self.score = score
    }
}

