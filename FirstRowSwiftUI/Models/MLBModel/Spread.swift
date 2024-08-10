// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let spread = try? newJSONDecoder().decode(Spread.self, from: jsonData)

import Foundation

// MARK: - Spread
class Spread: Codable {
    var pointSpreadAway, pointSpreadHome: Double?
    var pointSpreadAwayMoney,pointSpreadHomeMoney: Double?

    enum CodingKeys: String, CodingKey {
        case pointSpreadAway = "point_spread_away"
        case pointSpreadHome = "point_spread_home"
        case pointSpreadAwayMoney = "point_spread_away_money"
        case pointSpreadHomeMoney = "point_spread_home_money"

    }

    init(pointSpreadAway: Double? = 0.0, pointSpreadHome: Double? = 0.0, pointSpreadAwayMoney: Double? = 0.0, pointSpreadHomeMoney: Double? = 0.0) {
        self.pointSpreadAway = pointSpreadAway
        self.pointSpreadHome = pointSpreadHome
        self.pointSpreadAwayMoney = pointSpreadAwayMoney
        self.pointSpreadHomeMoney = pointSpreadHomeMoney
    }
}
