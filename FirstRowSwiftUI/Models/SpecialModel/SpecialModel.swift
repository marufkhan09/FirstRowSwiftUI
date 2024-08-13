import Foundation

// MARK: - SpecialModel
struct SpecialModel: Codable {
    let data: [SpecialData]
}

// MARK: - Datum
struct SpecialData: Codable, Identifiable {
    let id: Int
    let title, description, postedBy: String
    let image: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case id, title, description
        case postedBy = "posted_by"
        case image, status
    }
}
