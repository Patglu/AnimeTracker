import SwiftUI
import Combine

enum animeCategory{
    case airing
    case recommendations
}

class AnimeViewModel: ObservableObject{
    @Published var topAiringAnime = TempData().topAiring
    @Published var trendingAnime = TempData().recommendedAnime
    @Published var popularAnime = TempData().popularAnime
    @Published var detailAnime: DetailAnime = DetailAnime()
    @Published var searchedAnime: Searched?
    
    init() {
        if let url = TopAiring.url, let reccomendationURL = TopAiring.trending {
            fetchAnimeData(url, category: .airing)
            fetchAnimeData(reccomendationURL, category: .recommendations)
        }
    }
    
    func fetchAnimeData(_ url: URL,category: animeCategory) {
        switch category {
        case .airing:
            URLSession.shared.request(url: url) { [weak self] (pokemonData: TopAiring?, error: Error?) in
                guard let safePokemonData = pokemonData else { return }
                DispatchQueue.main.async {
                    self?.topAiringAnime = safePokemonData
                }
            }
        case .recommendations:
            URLSession.shared.request(url: url) { [weak self] (animeData: RecommendedAnime?, error: Error?) in
                guard let safeAnimeData = animeData else { return }
                DispatchQueue.main.async {
                    self?.trendingAnime = safeAnimeData
                }
            }
        }
    }
    
    func getDetailAnime(_ animeID: Int){
        URLSession.shared.request(url: URL(string: "https://api.jikan.moe/v4/anime/\(animeID)/full")!) { [weak self] (detailAnimeData: DetailAnime?, error: Error?) in
            guard let safeDetailData = detailAnimeData else { return }
            DispatchQueue.main.async {
                self?.detailAnime = safeDetailData
            }
        }
    }
    
    func getSearchedItems(_ searchedItem: String){
        URLSession.shared.request(url: URL(string: "https://api.jikan.moe/v4/anime?q=\(searchedItem)")!) { [weak self] (searchAnimeData: Searched?, error: Error?) in
            guard let safeSearchData = searchAnimeData else { return }
            DispatchQueue.main.async {
                self?.searchedAnime = safeSearchData
            }
        }
    }
    
}




