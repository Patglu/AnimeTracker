import SwiftUI

struct ExplorerView: View {
    @ObservedObject var animeNetwork = AnimeTrackerManager()
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach( animeNetwork.topAiring.data, id: \.self) { airing in
                    Text(airing.title)
                }
            }
        }
    }
}

struct ExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerView()
    }
}
