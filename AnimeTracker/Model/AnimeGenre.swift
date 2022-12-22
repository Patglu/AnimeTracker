import Foundation


struct AnimeGenre: Codable{
    let data: [genre]
}


struct genre: Codable{
    let malID: Int
    let name: String
    let url: String
    let count: Int

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case name, url, count
    }
}
