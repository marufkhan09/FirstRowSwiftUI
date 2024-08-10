// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let moneyline = try? newJSONDecoder().decode(Moneyline.self, from: jsonData)

import Foundation

// MARK: - Moneyline
class Moneyline: Codable {
    var moneylineAway, moneylineAwayDelta, moneylineHome, moneylineHomeDelta: Double?
    var moneylineDraw, moneylineDrawDelta: Double?
    var lineID: Int?
    var eventID: EventID?
    var sportID, affiliateID: Int?
    var dateUpdated: String?
    var format: Format?

    enum CodingKeys: String, CodingKey {
        case moneylineAway = "moneyline_away"
        case moneylineAwayDelta = "moneyline_away_delta"
        case moneylineHome = "moneyline_home"
        case moneylineHomeDelta = "moneyline_home_delta"
        case moneylineDraw = "moneyline_draw"
        case moneylineDrawDelta = "moneyline_draw_delta"
        case lineID = "line_id"
        case eventID = "event_id"
        case sportID = "sport_id"
        case affiliateID = "affiliate_id"
        case dateUpdated = "date_updated"
        case format
    }

    init(moneylineAway: Double?, moneylineAwayDelta: Double?, moneylineHome: Double?, moneylineHomeDelta: Double?, moneylineDraw: Double?, moneylineDrawDelta: Double?, lineID: Int?, eventID: EventID?, sportID: Int?, affiliateID: Int?, dateUpdated: String?, format: Format?) {
        self.moneylineAway = moneylineAway
        self.moneylineAwayDelta = moneylineAwayDelta
        self.moneylineHome = moneylineHome
        self.moneylineHomeDelta = moneylineHomeDelta
        self.moneylineDraw = moneylineDraw
        self.moneylineDrawDelta = moneylineDrawDelta
        self.lineID = lineID
        self.eventID = eventID
        self.sportID = sportID
        self.affiliateID = affiliateID
        self.dateUpdated = dateUpdated
        self.format = format
    }
}
