
import SwiftUI

struct ContentView: View {
//    var seasonalAnimeTracker = AnimeNetworkManager()
    @AppStorage("selectedTab") var selectedTab:Tab = .explore
    
    var body: some View {
        ZStack(alignment: .bottom){
            Group {
                switch selectedTab {
                case .library:
                    LibraryView()
                        
                case .explore:
                    DiscoveryView()
                        
                case .search:
                    SearchView()
                }
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            TabBar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear
                .frame( height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
