// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let teamsNormalized = try? newJSONDecoder().decode(TeamsNormalized.self, from: jsonData)

import Foundation

// MARK: - TeamsNormalized
class TeamsNormalized: Codable {
    var name, mascot, abbreviation: String?
    var isAway, isHome: Bool?

    enum CodingKeys: String, CodingKey {
        case name, mascot, abbreviation
        case isAway = "is_away"
        case isHome = "is_home"

    }

    init(name: String? = "", mascot: String? = "", abbreviation: String? = "", isAway: Bool? = false, isHome: Bool? = false) {
        self.name = name
        self.mascot = mascot
        self.abbreviation = abbreviation
        self.isAway = isAway
        self.isHome = isHome
    }
}
