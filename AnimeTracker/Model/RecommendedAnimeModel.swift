import Foundation

struct RecommendedAnime: Codable {
    let data: [Recommnded]
}


struct Recommnded: Codable, Hashable {
    let malID: String
    let entry: [Entry]
    let content: String
    

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case entry, content
    }
    
    static func == (lhs: Recommnded, rhs: Recommnded) -> Bool {
        return lhs.malID == rhs.malID && lhs.content == lhs.content
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(malID)
    }
}


struct Entry: Codable, Hashable {
    let malID: Int
    let url: String
    let images: [String: RecommendedImage]
    var image: String? {
        images.first?.value.largeImageURL ?? ""
    }
    let title: String

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url, images, title
    }
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.malID == rhs.malID && lhs.url == lhs.url
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(malID)
    }
}

struct RecommendedImage: Codable {
    let imageURL, smallImageURL, largeImageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case smallImageURL = "small_image_url"
        case largeImageURL = "large_image_url"
    }
}

struct RecPagination: Codable {
    let lastVisiblePage: Int
    let hasNextPage: Bool

    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
    }
}
