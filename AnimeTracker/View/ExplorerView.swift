import SwiftUI

struct ExplorerView: View {
    @ObservedObject var animeNetwork = AnimeTrackerManager()
    var body: some View {
        Text("Hello, World!")
        ForEach( animeNetwork.topAiring.data, id: \.self) { airing in
            
        }
    }
}

struct ExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerView()
    }
}
