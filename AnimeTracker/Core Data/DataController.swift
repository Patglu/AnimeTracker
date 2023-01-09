import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "AnimeTracker")
    
    init() {
        container.loadPersistentStores { descrip, error in
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
