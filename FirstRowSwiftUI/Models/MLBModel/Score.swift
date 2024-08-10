//
//  Score.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//
import Foundation

// MARK: - Score
class Score: Codable {
    var scoreAway, scoreHome: Int?
    var broadcast, eventStatusDetail: String?
    
    enum CodingKeys: String, CodingKey {
        case scoreAway = "score_away"
        case scoreHome = "score_home"
        case broadcast
        case eventStatusDetail = "event_status_detail"
    }
    init(scoreAway: Int? = 0, scoreHome: Int? = 0, broadcast: String? = "", eventStatusDetail: String? = "") {
        self.scoreAway = scoreAway
        self.scoreHome = scoreHome
        self.broadcast = broadcast
        self.eventStatusDetail = eventStatusDetail
    }
}
