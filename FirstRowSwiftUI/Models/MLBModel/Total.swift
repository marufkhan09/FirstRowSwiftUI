// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let total = try? newJSONDecoder().decode(Total.self, from: jsonData)

import Foundation

// MARK: - Total
class Total: Codable {
    var totalOver, totalUnder: Double?
    var totalOverMoney, totalUnderMoney: Double?

    enum CodingKeys: String, CodingKey {
        case totalOver = "total_over"
        case totalUnder = "total_under"
        case totalOverMoney = "total_over_money"
        case totalUnderMoney = "total_under_money"
    }
    
    init(totalOver: Double? = 0.0, totalUnder: Double? = 0.0, totalOverMoney: Double? = 0.0, totalUnderMoney: Double? = 0.0) {
        self.totalOver = totalOver
        self.totalUnder = totalUnder
        self.totalOverMoney = totalOverMoney
        self.totalUnderMoney = totalUnderMoney
    }


}
