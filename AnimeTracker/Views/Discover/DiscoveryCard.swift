import SwiftUI

struct DiscoveryCard: View {
    var info: Airing
    @ObservedObject var animeViewModel = AnimeViewModel()
    var body: some View {
        GeometryReader { geo in
            NavigationLink(destination: AnimeDetailView(anime: animeViewModel.detailAnime?.data ?? TempData().fullAnimeDetail.data)) {
                AsyncImage(url: URL(string: info.image ?? "")){ image in
                    image
                        .resizable()
                        .aspectRatio(3/4,contentMode: .fill)
                        .frame(width: geo.size.width)
                        .overlay {
                            InfoOverlay(info: info)
                        }
                    
                } placeholder: {
                    ProgressView()
                }
            }
            .simultaneousGesture(TapGesture().onEnded{
                animeViewModel.getDetailAnime(info.malID)
            })
        }
    }
}

struct DiscoveryCard_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryCard(info: TempData().topAiring.data[1])
    }
}

struct InfoOverlay: View{
    var info: Airing
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black, .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View{
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(info.title)
                    .font(.title)
                    .bold()
                
                HStack {
                    Text(info.genres.first?.name ?? "")
                }
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}
