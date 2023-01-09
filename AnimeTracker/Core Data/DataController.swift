import CoreData
import Foundation

class DataController: ObservableObject{
    @Published var savedAnime:[Anime] = []
    let container = NSPersistentContainer(name: "AnimeTracker")
    
    init() {
        container.loadPersistentStores { descrip, error in
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        fetchAnimes()
    }
    
    func fetchAnimes(){
        let request = NSFetchRequest<Anime>(entityName: "Anime")
        do{
          savedAnime = try container.viewContext.fetch(request)
        } catch let error{
            print("Error fetching \(error)")
        }
    }
    
    func addAnime(title: String, animeID: Int){
        let newAnime = Anime(context: container.viewContext)
        newAnime.title = title
        newAnime.id = Int64(animeID)
        saveData()
    }
    
    func removeAnime(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let entity = savedAnime[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchAnimes()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}
