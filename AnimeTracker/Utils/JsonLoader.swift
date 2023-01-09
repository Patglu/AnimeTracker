import Foundation
import Combine

class Genres: ObservableObject  {
    enum genreTypes{
        case genre
        case theme
        case demographics
    }
    
    @Published var genres : AnimeGenre = load("AnimeGenres.json")
    @Published var themes : AnimeGenre = load("AnimeThemes.json")
    @Published var demographics : AnimeGenre = load("AnimeDemographics.json")
    
    
   
    
    func listGenres(genreType: genreTypes) -> [String]{
        var genreList = [String]()
        switch genreType{
        case .genre:
            return genreArray(genreList: &genreList, genres)
        case .theme:
            return genreArray(genreList: &genreList, themes)
        case .demographics:
            return genreArray(genreList: &genreList, demographics)
        }
    }
     
    private func genreArray(genreList: inout [String],_ ogArray: AnimeGenre) -> [String] {
        for genre in ogArray.data{
            genreList.append(genre.name)
        }
        return genreList
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
