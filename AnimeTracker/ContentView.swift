
import SwiftUI

struct ContentView: View {
    var seasonalAnimeTracker = AnimeNetworkManager()
    var body: some View {
//            LibraryView()
            DiscoveryView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
