import Foundation

protocol AnimeUrl : Codable {
     var url: URL {get }
}

struct TopAiring: Codable {
    let pagination: Pagination
    let data: [Airing]
}
 
extension TopAiring{
   static let url = URL(string: "https://api.jikan.moe/v4/top/anime?filter=airing")
    static let urlString =  "https://api.jikan.moe/v4/top/anime?filter=airing"
}


struct Airing: Codable {
    let malID: Int
    let images: [String: animeImage]

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case images
    }
}


struct Aired: Codable {
    let from: Date
    let to: Date?
    let prop: Prop
    let string: String
}


struct Prop: Codable {
    let from, to: From
}


struct From: Codable {
    let day, month, year: Int?
}


struct Broadcast: Codable {
    let day, time: String?
    let timezone: Timezone?
    let string: String?
}

enum Timezone: String, Codable {
    case asiaTokyo = "Asia/Tokyo"
}


struct Demographic: Codable {
    let malID: Int
    let type: DemographicType
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case type, name, url
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


struct Title: Codable {
    let type: TitleType
    let title: String
}

enum TitleType: String, Codable {
    case english = "English"
    case german = "German"
    case japanese = "Japanese"
    case spanish = "Spanish"
    case synonym = "Synonym"
    case typeDefault = "Default"
}


struct Trailer: Codable {
    let youtubeID: String?
    let url, embedURL: String?
    let images: Images

    enum CodingKeys: String, CodingKey {
        case youtubeID = "youtube_id"
        case url
        case embedURL = "embed_url"
        case images
    }
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
}


struct Items: Codable {
    let count, total, perPage: Int

    enum CodingKeys: String, CodingKey {
        case count, total
        case perPage = "per_page"
    }
}
