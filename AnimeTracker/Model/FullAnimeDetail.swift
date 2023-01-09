import Foundation

// MARK: - DetailAnime
struct DetailAnime: Codable {
    let data: AnimeData?
    init(data: AnimeData? = nil) {
        self.data = data
    }
    
}

// MARK: - AnimeData
struct AnimeData: Codable {
    let malID: Int
    let url: String
    let images: [String: Photo]
    var image: String? {
        images.first?.value.largeImageURL ?? ""
    }
    let trailer: Trailer
    let approved: Bool
    let titles: [Title]
    let title, titleEnglish, titleJapanese: String
    let titleSynonyms: [String]
    let type, source: String
    let episodes: Int
    let status: String
    let airing: Bool
    let aired: Aired
    let duration, rating: String
    let score: Double?
    let scoredBy, rank, popularity, members: Int?
    let favorites: Int
    let synopsis, background, season: String?
    let year: Int
    let broadcast: Broadcast
    let producers, licensors, studios, genres: [Demographic]
    let demographics: [Demographic]
    let relations: [Relation]
    let theme: Theme
    let streaming: [Streaming]

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url, images, trailer, approved, titles, title
        case titleEnglish = "title_english"
        case titleJapanese = "title_japanese"
        case titleSynonyms = "title_synonyms"
        case type, source, episodes, status, airing, aired, duration, rating, score
        case scoredBy = "scored_by"
        case rank, popularity, members, favorites, synopsis, background, season, year, broadcast, producers, licensors, studios, genres
        case demographics, theme, streaming, relations
    }
}

// MARK: - Aired
struct Aired: Codable {
    let from : String
    let to: String
    let prop: Prop
    let string: String
}

// MARK: - Prop
struct Prop: Codable {
    let from, to: From
}

// MARK: - From
struct From: Codable {
    let day, month, year: Int
}

// MARK: - Broadcast
struct Broadcast: Codable {
    let day, time, timezone, string: String?
}


enum TypeEnum: String, Codable {
    case anime = "anime"
    case manga = "manga"
}

// MARK: - Photo
struct Photo: Codable {
    let imageURL, smallImageURL, largeImageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case smallImageURL = "small_image_url"
        case largeImageURL = "large_image_url"
    }
}

// MARK: - Relation
struct Relation: Codable {
    let relation: String
    let entry: [DetailDemographic]
}
// MARK: - Streaming
struct Streaming: Codable {
    let name: String
    let url: String
}

// MARK: - Theme
struct Theme: Codable {
    let openings, endings: [String]
}

// MARK: - Title
struct Title: Codable {
    let type, title: String
}

// MARK: - Trailer
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
//MARK: - DetailDemographic
struct DetailDemographic: Codable {
    let malID: Int
    let type: TypeEnum
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case type, name, url
    }
}
