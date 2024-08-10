// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mlbModel = try? newJSONDecoder().decode(MlbModel.self, from: jsonData)

import Foundation

// MARK: - MlbModel
class MlbModel: Codable {
    var data: [MlbData]?
    
    init(data: [MlbData]? = []) {
        self.data = data

    }
}
