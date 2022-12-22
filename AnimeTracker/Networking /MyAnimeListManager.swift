import Combine
import SwiftUI

class AnimeNetworkManager: ObservableObject{
    let baseURL = "https://api.myanimelist.net/v2/anime?q=one&limit=4"
    let token = "fb27036d2d58fb0c746aa1faa7bfe08a"
    @Published var topAiringAnime: TopAiring?
    
    init() {
        if let url = TopAiring.url {
            fetch(from: url)
        }
    }

    
    func fetch( from url: URL){
        URLSession.shared.request(url: url, expecting: TopAiring.self) { [weak self] result in
            switch result{
            case .success(let results):
                DispatchQueue.main.async {
                    self?.topAiringAnime = results
//                    print(self?.topAiringAnime?.data)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension URLSession{
    enum CustomError: Error{
        case invalidUrl
        case invalidData
    }
}

extension URLSession{
    func request<T: Codable>(
        url: URL?,
        expecting:T.Type,
        completion: @escaping(Result<T,Error>) -> Void){
            guard let url = url else {
                completion(.failure(CustomError.invalidUrl))
                return
            }
            
            let task = dataTask(with: url) { data, _, error in
                guard let data = data else{
                    if let error = error{
                        completion(.failure(error))
                    } else {
                        completion(.failure(CustomError.invalidData))
                    }
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(expecting, from: data)
                    completion(.success(result))
                }
                catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
}

