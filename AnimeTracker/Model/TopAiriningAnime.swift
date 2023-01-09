import Foundation

protocol AnimeUrl : Codable {
     var url: URL {get }
}

struct TopAiring: Codable {
    let pagination: Pagination
    let data: [Airing]
    
    init(pagination: Pagination = Pagination(), data: [Airing] = []) {
        self.pagination = pagination
        self.data = data
    }
}
 
extension TopAiring{
   static let url = URL(string: "https://api.jikan.moe/v4/top/anime?filter=airing")
    static let trending  = URL(string: "https://api.jikan.moe/v4/recommendations/anime")
    static let urlString =  "https://api.jikan.moe/v4/top/anime?filter=airing"
}


struct Airing: Codable, Hashable {
    static func == (lhs: Airing, rhs: Airing) -> Bool {
        return lhs.malID == rhs.malID && lhs.title == lhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(malID    )
    }
    
    let malID: Int
    let title: String
    let images: [String: animeImage]
    let studios: [Demographic]
    let genres: [Demographic]
    var image: String? {
        images.first?.value.largeImageURL ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case images
        case genres,  studios, title
    }
}




struct Demographic: Codable , Hashable{
    let malID: Int
    let type: DemographicType
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case type, name, url
    }
    
    static func == (lhs: Demographic, rhs: Demographic) -> Bool {
        return lhs.malID == rhs.malID && lhs.name == lhs.name
      }
      func hash(into hasher: inout Hasher) {
        hasher.combine(malID)
      }
}

enum DemographicType: String, Codable {
    case anime = "anime"
}


struct animeImage: Codable {
    let imageURL, smallImageURL, largeImageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case smallImageURL = "small_image_url"
        case largeImageURL = "large_image_url"
    }
}

enum Season: String, Codable {
    case fall = "fall"
    case spring = "spring"
    case summer = "summer"
    case winter = "winter"
}

enum Status: String, Codable {
    case currentlyAiring = "Currently Airing"
}





struct Images: Codable {
    let imageURL, smallImageURL, mediumImageURL, largeImageURL: String?
    let maximumImageURL: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case smallImageURL = "small_image_url"
        case mediumImageURL = "medium_image_url"
        case largeImageURL = "large_image_url"
        case maximumImageURL = "maximum_image_url"
    }
}

enum AiringType: String, Codable {
    case music = "Music"
    case ona = "ONA"
    case tv = "TV"
}


struct Pagination: Codable {
    let lastVisiblePage: Int
    let hasNextPage: Bool
    let currentPage: Int
    let items: Items

    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
        case currentPage = "current_page"
        case items
    }
    
    init(lastVisiblePage: Int = 0, hasNextPage: Bool = false, currentPage: Int = 0, items: Items = Items(count: 0, total: 0, perPage: 0)) {
        self.lastVisiblePage = lastVisiblePage
        self.hasNextPage = hasNextPage
        self.currentPage = currentPage
        self.items = items
    }
}


struct Items: Codable {
    let count, total, perPage: Int

    enum CodingKeys: String, CodingKey {
        case count, total
        case perPage = "per_page"
    }
}
