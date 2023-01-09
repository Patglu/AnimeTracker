import SwiftUI
import AVKit
import AVFoundation

struct AnimeDetailView: View {
    var anime: AnimeData
    @State private var backgroundColor: Color = .clear
    @State private var isExpanded: Bool = false
    @State private var showOptions: Bool = false
    @StateObject var vm = DataController()
    var body: some View {
        GeometryReader { geo in
            ScrollView{
                animeImage(geo: geo)
                    .frame(width: geo.size.width, height: geo.size.height / 1.3)
                    .overlay(alignment: .bottom){
                        overlayInformation(geo: geo)
                    }
                Text(anime.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding([.horizontal,.top])
                animeExtraInformation
                Divider()
                    .frame(width: geo.size.width / 1.2)
                VStack{
                    Text("Genres")
                        .subTitleStyle()
                    HStack{
                        ForEach(anime.genres, id: \.self) { genre in
                            Text(genre.name)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.black, in: Capsule())
                        }
                    }
                    Text("Synopsis")
                        .subTitleStyle()
                    Text(anime.synopsis ?? "")
                        .font(.subheadline)
                        .lineLimit(isExpanded ? nil : 3)
                        .overlay(
                            GeometryReader { proxy in
                                Button(action: {
                                    withAnimation(.interpolatingSpring(stiffness: 100, damping: 25)){
                                        isExpanded.toggle()
                                        vm.addAnime(title: anime.title, animeID: anime.malID)

                                    }
                                }) {
                                    Text(isExpanded ? "Less" : "More")
                                        .font(.caption).bold()
                                        .padding(.horizontal, 8.0)
                                        .padding( .vertical,4.0)
                                        .background(.ultraThickMaterial, in: Capsule())
                                    
                                }
                                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                            }
                        )
                        .padding(.bottom,2)
                    Text("Trailer")
                        .subTitleStyle()
                    VideoPlayer(player: AVPlayer(url:  URL(string: anime.trailer.url ?? "")!))
                        .frame(height: 200)
                        .cornerRadius(10)
                    Text("Studio")
                        .subTitleStyle()
                    Text(anime.studios.first?.name ?? "")
                        .hLeading()
                    // FIXME: More than one studio
                }
                .padding(.horizontal)
                
                
                Spacer()
                    .frame(height: geo.size.height / 5)
            }
            
        }
        .ignoresSafeArea(edges: .top)
    }
    
}

struct AnimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeDetailView(anime: TempData().fullAnimeDetail.data ?? TempData().fullAnimeDetail.data!)
    }
}

extension AnimeDetailView{
    func overlayInformation(geo : GeometryProxy) -> some View {
        HStack {
            HStack(spacing: 35){
                VStack {
                    Text("\(anime.score ?? 0.0,specifier:  "%.2f")")
                        .fontWeight(.semibold)
                    Text("Score")
                        .font(.subheadline)
                }
                informationMetrics(title: "Rank", value: anime.rank)
                informationMetrics(title: "Popularity", value: anime.popularity)
                
            }
            .frame(width: geo.size.width / 1.4, height: geo.size.height / 18)
            .background(.ultraThinMaterial, in: Capsule(style: .continuous))
            Button {
                withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)){
                    showOptions.toggle()
                }
            } label: {
                Image(systemName: showOptions ? "checkmark" : "plus" )
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(width: geo.size.width / 8, height: geo.size.height / 18)
                    .background(.ultraThinMaterial, in: Circle())
            }
        }
        .padding(.bottom)
    }
    func animeImage(geo : GeometryProxy) -> some View {
        ZStack{
            AsyncImage(url: URL(string: anime.image ?? "")){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                ProgressView()
            }
            Blur(style: .regular)
            AsyncImage(url: URL(string: anime.image ?? "")){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                    .mask(
                        LinearGradient(stops: [.init(color: .white, location: 0),
                                               .init(color: .white, location: 0.75),
                                               .init(color: .white.opacity(0), location: 0.9)], startPoint: .top, endPoint: .bottom)
                    )
            } placeholder: {
                ProgressView()
            }
        }
    }
    func informationMetrics(title: String, value: Int?) -> some View{
        VStack {
            Text("\(value ?? 0)")
                .fontWeight(.semibold)
                .font(.subheadline)
            Text(title)
                .font(.subheadline)
            
        }
    }
    var animeExtraInformation : some View{
        VStack {
            HStack{
                Text("Status:")
                Text("\(anime.status)")
                    .bold()
                Divider()
                Text("Year:")
                Text("\(anime.year)")
                    .bold()
            }
            HStack{
                Text("Episodes:")
                Text("\(anime.episodes)")
                    .bold()
                Divider()
                Text("Source :")
                Text("\(anime.source)")
                    .bold()
            }
            HStack{
                Text("Season:")
                Text(anime.season ?? "")
                    .bold()
            }
        }
        .font(.footnote)
        .padding(.bottom)
    }
}


