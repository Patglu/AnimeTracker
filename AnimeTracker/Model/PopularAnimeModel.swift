
import Foundation

// MARK: - PopularAnime
struct PopularAnime: Codable {
    let data: [Popular]
}

// MARK: - Datum
struct Popular: Codable, Hashable {
    let malID: Int
    let url: String
    let images: [String: PopularImage]
    var image: String? {
        images.first?.value.largeImageURL ?? ""
    }
    let titleEnglish: String
    let duration: String
    let rating: Rating
    let score: Double
    let scoredBy, rank, popularity: Int
    let genres: [Demographic]

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url, images
        case titleEnglish = "title_english"
        case  duration, rating, score
        case scoredBy = "scored_by"
        case rank,popularity
        case genres
    }
    
    static func == (lhs: Popular, rhs: Popular) -> Bool {
        return lhs.malID == rhs.malID && lhs.url == lhs.url
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(malID)
    }
}

// MARK: - Image
struct PopularImage: Codable {
    let imageURL, smallImageURL, largeImageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case smallImageURL = "small_image_url"
        case largeImageURL = "large_image_url"
    }
}

enum Rating: String, Codable {
    case pg13Teens13OrOlder = "PG-13 - Teens 13 or older"
    case r17ViolenceProfanity = "R - 17+ (violence & profanity)"
}







