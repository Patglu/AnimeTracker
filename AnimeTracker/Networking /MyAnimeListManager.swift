import Foundation
import Combine

class AnimeTrackerManager: ObservableObject{
    @Published var topAiring = BasicAnimeModel(data: [])
    private var topAiringURL = URL(string: "https://api.jikan.moe/v4/top/anime?filter=airing")
    
    init() {
        getTopAiring()
    }
    
    func getTopAiring(){
        URLSession.shared.request(url: topAiringURL! ) { [weak self] (animeData: BasicAnimeModel?, error: Error?) in
                guard let safeAnimeData = animeData else { return }
                DispatchQueue.main.async {
                    self?.topAiring = safeAnimeData
                }
            }
    }
    
   
    

}
