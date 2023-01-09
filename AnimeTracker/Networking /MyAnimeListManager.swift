import Combine
import SwiftUI

class AnimeNetworkManager: ObservableObject{
    let baseURL = "https://api.myanimelist.net/v2/anime?q=one&limit=4"
    let token = "fb27036d2d58fb0c746aa1faa7bfe08a"
    @Published var topAiringAnime: TopAiring?
}

extension URLSession{
    enum CustomError: Error{
        case invalidUrl
        case invalidData
    }
}

extension URLSession{
    func request<T: Decodable>(url: URL,
                                    completion: @escaping (T?, Error?) -> Void) {
       let request = URLRequest(url: url, timeoutInterval: 5)
       let task = URLSession.shared.dataTask(with: request) { data, response, error in
           var decodedResponse: T? = nil
           if let data = data {
               decodedResponse = try? JSONDecoder().decode(T.self, from: data)
           }
           completion(decodedResponse, error)
       }
       task.resume()
   }
}

