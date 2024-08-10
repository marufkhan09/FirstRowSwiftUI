// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let spread = try? newJSONDecoder().decode(Spread.self, from: jsonData)

import Foundation

// MARK: - Spread
class Spread: Codable {
    var pointSpreadAway, pointSpreadHome, pointSpreadAwayDelta, pointSpreadHomeDelta: Double?
    var pointSpreadAwayMoney, pointSpreadAwayMoneyDelta, pointSpreadHomeMoney, pointSpreadHomeMoneyDelta: Double?
    var lineID: Int?
    var eventID: EventID?
    var sportID, affiliateID: Int?
    var dateUpdated: String?
    var format: Format?
    var extendedSpreads: [Spread]?

    enum CodingKeys: String, CodingKey {
        case pointSpreadAway = "point_spread_away"
        case pointSpreadHome = "point_spread_home"
        case pointSpreadAwayDelta = "point_spread_away_delta"
        case pointSpreadHomeDelta = "point_spread_home_delta"
        case pointSpreadAwayMoney = "point_spread_away_money"
        case pointSpreadAwayMoneyDelta = "point_spread_away_money_delta"
        case pointSpreadHomeMoney = "point_spread_home_money"
        case pointSpreadHomeMoneyDelta = "point_spread_home_money_delta"
        case lineID = "line_id"
        case eventID = "event_id"
        case sportID = "sport_id"
        case affiliateID = "affiliate_id"
        case dateUpdated = "date_updated"
        case format
        case extendedSpreads = "extended_spreads"
    }

    init(pointSpreadAway: Double?, pointSpreadHome: Double?, pointSpreadAwayDelta: Double?, pointSpreadHomeDelta: Double?, pointSpreadAwayMoney: Double?, pointSpreadAwayMoneyDelta: Double?, pointSpreadHomeMoney: Double?, pointSpreadHomeMoneyDelta: Double?, lineID: Int?, eventID: EventID?, sportID: Int?, affiliateID: Int?, dateUpdated: String?, format: Format?, extendedSpreads: [Spread]?) {
        self.pointSpreadAway = pointSpreadAway
        self.pointSpreadHome = pointSpreadHome
        self.pointSpreadAwayDelta = pointSpreadAwayDelta
        self.pointSpreadHomeDelta = pointSpreadHomeDelta
        self.pointSpreadAwayMoney = pointSpreadAwayMoney
        self.pointSpreadAwayMoneyDelta = pointSpreadAwayMoneyDelta
        self.pointSpreadHomeMoney = pointSpreadHomeMoney
        self.pointSpreadHomeMoneyDelta = pointSpreadHomeMoneyDelta
        self.lineID = lineID
        self.eventID = eventID
        self.sportID = sportID
        self.affiliateID = affiliateID
        self.dateUpdated = dateUpdated
        self.format = format
        self.extendedSpreads = extendedSpreads
    }
}
