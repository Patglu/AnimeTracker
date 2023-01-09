import Foundation

struct Searched: Codable {
    let data: [SearchedItem]
}

struct SearchedItem: Codable, Hashable {
    let malID: Int
    let url: String
    let title: String
    let images: [String: Photo]
    var image: String? {
        images.first?.value.largeImageURL ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url, images, title
    }
    
    static func == (lhs: SearchedItem, rhs: SearchedItem) -> Bool {
        return lhs.malID == rhs.malID && lhs.url == lhs.url
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(malID)
    }
}
