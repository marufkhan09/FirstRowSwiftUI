// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let datum = try? newJSONDecoder().decode(Datum.self, from: jsonData)

import Foundation

// MARK: - Datum
class Datum: Codable {
    var id: Int?
    var name: String?
    var isPick: Bool?
    var url: JSONNull?
    var sportID: String?
    var sportName: SportName?
    var eventDate: Date?
    var score: Score?
    var teamsNormalized: [TeamsNormalized]?
    var schedule: Schedule?
    var lines: [Line]?
    var message: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name
        case isPick = "is_pick"
        case url
        case sportID = "sport_id"
        case sportName = "sport_name"
        case eventDate = "event_date"
        case score
        case teamsNormalized = "teams_normalized"
        case schedule, lines, message
    }

    init(id: Int?, name: String?, isPick: Bool?, url: JSONNull?, sportID: String?, sportName: SportName?, eventDate: Date?, score: Score?, teamsNormalized: [TeamsNormalized]?, schedule: Schedule?, lines: [Line]?, message: JSONNull?) {
        self.id = id
        self.name = name
        self.isPick = isPick
        self.url = url
        self.sportID = sportID
        self.sportName = sportName
        self.eventDate = eventDate
        self.score = score
        self.teamsNormalized = teamsNormalized
        self.schedule = schedule
        self.lines = lines
        self.message = message
    }
}
