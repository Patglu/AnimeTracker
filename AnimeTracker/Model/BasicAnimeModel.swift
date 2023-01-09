import Foundation

struct BasicAnimeModel: Codable {
    let data: [BasicData]
}

struct BasicData: Codable {
    let malID: Int
    let images: [String: AnimeImage]
    var image: String? {
        images.first?.value.largeImageURL ?? ""
    }
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case images, title
    }
    
    struct AnimeImage: Codable {
        let imageURL, smallImageURL, largeImageURL: String
        
        enum CodingKeys: String, CodingKey {
            case imageURL = "image_url"
            case smallImageURL = "small_image_url"
            case largeImageURL = "large_image_url"
        }
    }
    
    struct Title: Codable {
        let title: String
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
    
    
}
