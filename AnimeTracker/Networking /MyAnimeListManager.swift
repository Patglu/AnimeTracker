import Foundation

class AnimeTrackerManager{
    let baseURL = "https://api.myanimelist.net/v2/anime?q=one&limit=4"
    let token = "fb27036d2d58fb0c746aa1faa7bfe08a"
    
    init() {
        searchAnime {
            
        }
    }
    
    func searchAnime( completion: @escaping () -> Void) {
        guard var url = URL(string: baseURL) else {
            return
        }

        var request = URLRequest(url: url)

        request.addValue(token, forHTTPHeaderField: "X-MAL-CLIENT-ID")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let safeData = data {
                let seasonalAnime = try? JSONDecoder().decode(SeasonalAnime.self, from: safeData)
                print(seasonalAnime?.data[0].node.title)
            } else {
                print(error?.localizedDescription)
            }
        }
        .resume()
    }
}
