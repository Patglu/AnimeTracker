// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let seasonalAnime = try? newJSONDecoder().decode(SeasonalAnime.self, from: jsonData)

import Foundation

// MARK: - SeasonalAnime
struct SeasonalAnime: Codable {
    let data: [Datum]
    let paging: Paging
}

// MARK: - Datum
struct Datum: Codable {
    let node: Node
}

// MARK: - Node
struct Node: Codable {
    let id: Int
    let title: String
    let mainPicture: MainPicture

    enum CodingKeys: String, CodingKey {
        case id, title
        case mainPicture = "main_picture"
    }
}

// MARK: - MainPicture
struct MainPicture: Codable {
    let medium, large: String
}

// MARK: - Paging
struct Paging: Codable {
    let next: String
}