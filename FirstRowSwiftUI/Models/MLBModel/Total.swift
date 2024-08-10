// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let total = try? newJSONDecoder().decode(Total.self, from: jsonData)

import Foundation

// MARK: - Total
class Total: Codable {
    var totalOver, totalOverDelta, totalUnder, totalUnderDelta: Double?
    var totalOverMoney, totalOverMoneyDelta, totalUnderMoney, totalUnderMoneyDelta: Double?
    var lineID: Int?
    var eventID: EventID?
    var sportID, affiliateID: Int?
    var dateUpdated: String?
    var format: Format?
    var extendedTotals: [Total]?

    enum CodingKeys: String, CodingKey {
        case totalOver = "total_over"
        case totalOverDelta = "total_over_delta"
        case totalUnder = "total_under"
        case totalUnderDelta = "total_under_delta"
        case totalOverMoney = "total_over_money"
        case totalOverMoneyDelta = "total_over_money_delta"
        case totalUnderMoney = "total_under_money"
        case totalUnderMoneyDelta = "total_under_money_delta"
        case lineID = "line_id"
        case eventID = "event_id"
        case sportID = "sport_id"
        case affiliateID = "affiliate_id"
        case dateUpdated = "date_updated"
        case format
        case extendedTotals = "extended_totals"
    }

    init(totalOver: Double?, totalOverDelta: Double?, totalUnder: Double?, totalUnderDelta: Double?, totalOverMoney: Double?, totalOverMoneyDelta: Double?, totalUnderMoney: Double?, totalUnderMoneyDelta: Double?, lineID: Int?, eventID: EventID?, sportID: Int?, affiliateID: Int?, dateUpdated: String?, format: Format?, extendedTotals: [Total]?) {
        self.totalOver = totalOver
        self.totalOverDelta = totalOverDelta
        self.totalUnder = totalUnder
        self.totalUnderDelta = totalUnderDelta
        self.totalOverMoney = totalOverMoney
        self.totalOverMoneyDelta = totalOverMoneyDelta
        self.totalUnderMoney = totalUnderMoney
        self.totalUnderMoneyDelta = totalUnderMoneyDelta
        self.lineID = lineID
        self.eventID = eventID
        self.sportID = sportID
        self.affiliateID = affiliateID
        self.dateUpdated = dateUpdated
        self.format = format
        self.extendedTotals = extendedTotals
    }
}
