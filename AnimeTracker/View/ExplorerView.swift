import SwiftUI

struct ExplorerView: View {
    @ObservedObject var animeNetwork = AnimeTrackerManager()
    var body: some View {
        GeometryReader { geo in
            ScrollView{
                TabView {
                    cachedImage
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .frame(height: 550)
                
            }
            .ignoresSafeArea(edges:.top)
        }
    }
}

struct ExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerView()
    }
}

extension ExplorerView{
    var cachedImage: some View{
        ForEach( animeNetwork.topAiring.data, id: \.self) { airing in
            VStack {
                AsyncImage(url: URL(string: airing.image ?? "")!, placeholder: {Color.black}, image: { image in
                    Image(uiImage: image)
                        .resizable()
                })
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottom) {
                    Text(airing.title)
                        .lineLimit(1)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                }
            }
        }
    }
}
