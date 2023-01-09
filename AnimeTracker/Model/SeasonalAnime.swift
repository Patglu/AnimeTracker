
import Foundation

// MARK: - SeasonalAnime
struct SeasonalAnime: Codable {
    let data: [Datum]
    let paging: Paging
}

struct Datum: Codable {
    let node: Node
}


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
