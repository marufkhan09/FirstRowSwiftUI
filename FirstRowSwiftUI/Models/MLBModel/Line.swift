// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let line = try? newJSONDecoder().decode(Line.self, from: jsonData)

import Foundation

// MARK: - Line
class Line: Codable {
    var lineID: Int?
    var moneyline: Moneyline?
    var spread: Spread?
    var total: Total?
    var affiliate: Affiliate?

    enum CodingKeys: String, CodingKey {
        case lineID = "line_id"
        case moneyline, spread, total, affiliate
    }

    init(lineID: Int?, moneyline: Moneyline?, spread: Spread?, total: Total?, affiliate: Affiliate?) {
        self.lineID = lineID
        self.moneyline = moneyline
        self.spread = spread
        self.total = total
        self.affiliate = affiliate
    }
}
