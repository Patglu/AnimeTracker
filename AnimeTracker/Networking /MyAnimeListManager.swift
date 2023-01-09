import Combine
import SwiftUI

class AnimeNetworkManager: ObservableObject{
   
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

