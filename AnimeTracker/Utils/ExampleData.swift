
import Foundation

class TempData: ObservableObject  {
    @Published var topAiring : TopAiring = load("TempAiring.json")
    @Published var recommendedAnime: RecommendedAnime = load("AnimeRecommendations.json")
    @Published var popularAnime: PopularAnime = load("AnimePopularity.json")
    @Published var fullAnimeDetail: DetailAnime = load("AnimeFullDetail.json")
}
