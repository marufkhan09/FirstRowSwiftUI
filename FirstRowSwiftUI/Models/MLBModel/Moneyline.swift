// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let moneyline = try? newJSONDecoder().decode(Moneyline.self, from: jsonData)

import Foundation

// MARK: - Moneyline
class Moneyline: Codable {
    var moneylineAway, moneylineHome: Double?


    enum CodingKeys: String, CodingKey {
        case moneylineAway = "moneyline_away"
        case moneylineHome = "moneyline_home"

    }
    
    init(moneylineAway: Double? = 0.0, moneylineHome: Double? = 0.0) {
        self.moneylineAway = moneylineAway
        self.moneylineHome = moneylineHome
    }


}
