// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let line = try? newJSONDecoder().decode(Line.self, from: jsonData)

import Foundation

// MARK: - Line
class Line: Codable {
    var moneyline: Moneyline?
    var spread: Spread?
    var total: Total?

    enum CodingKeys: String, CodingKey {

        case moneyline, spread, total
    }

    init(moneyline: Moneyline? = Moneyline(), spread: Spread? = Spread(), total: Total? = Total()) {
        self.moneyline = moneyline
        self.spread = spread
        self.total = total
    }
}
