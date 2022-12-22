import SwiftUI
import Combine

struct AnimeImages{
    var imageQuality: String
    var imageUrl: String
}
class DiscoveryViewModel: ObservableObject{
    @Published var topAiringAnime: TopAiring?
    @Published var topAnimeImages = [AnimeImages]()

    
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
    
    func getImages() -> [String]{
        var animeImages = [String]()
        
        if let animeTop = topAiringAnime?.data{
            for aniImages in animeTop {
                for (_, value) in aniImages.images{
                    if value.largeImageURL.contains("jpg"){
                        animeImages.append(value.largeImageURL)
                    }
                }
            }
        }
        return animeImages
    }
    
//     Images for trending anime
    func animeImages(){
        guard let topAnime = topAiringAnime?.data else { return }
        for anime in topAnime {
            for (key,value) in anime.images{
                print(value.largeImageURL)
                self.topAnimeImages.append(AnimeImages(imageQuality: key, imageUrl: value.largeImageURL))
            }
        }
    }
    


}

