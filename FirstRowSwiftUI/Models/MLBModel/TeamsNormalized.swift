// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let teamsNormalized = try? newJSONDecoder().decode(TeamsNormalized.self, from: jsonData)

import Foundation

// MARK: - TeamsNormalized
class TeamsNormalized: Codable {
    var teamID: Int?
    var name, mascot, abbreviation: String?
    var conferenceID, divisionID, ranking: Int?
    var record: String?
    var isAway, isHome: Bool?
    var conference, division: Conference?

    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case name, mascot, abbreviation
        case conferenceID = "conference_id"
        case divisionID = "division_id"
        case ranking, record
        case isAway = "is_away"
        case isHome = "is_home"
        case conference, division
    }

    init(teamID: Int?, name: String?, mascot: String?, abbreviation: String?, conferenceID: Int?, divisionID: Int?, ranking: Int?, record: String?, isAway: Bool?, isHome: Bool?, conference: Conference?, division: Conference?) {
        self.teamID = teamID
        self.name = name
        self.mascot = mascot
        self.abbreviation = abbreviation
        self.conferenceID = conferenceID
        self.divisionID = divisionID
        self.ranking = ranking
        self.record = record
        self.isAway = isAway
        self.isHome = isHome
        self.conference = conference
        self.division = division
    }
}
