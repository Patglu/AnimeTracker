import SwiftUI

struct DiscoveryView: View {
    @State private var searchText = ""
    @ObservedObject var genre = Genres()
    @ObservedObject var discoveryViewModel = AnimeViewModel()
    let range: Range = 0..<10
    var body: some View {
        NavigationView{
            List{
                Section {
                    PageView(pages: discoveryViewModel.topAiringAnime.data.map  {
                        DiscoveryCard(info: $0)
                    })
                    .frame(height: 550)
                    .listRowInsets(EdgeInsets())
                }
                .listSectionSeparator(.hidden, edges: .top)

                Section {
                    ScrollingRowView(scrollOptions: .recommendations)
                        .onAppear{
                            discoveryViewModel.fetchAnimeData(TopAiring.trending!, category: .recommendations)
                        }
                } header: {
                    Text("Recommendations")
                        .font(.title2.bold())
                }
                .listSectionSeparatorTint(.clear,edges: .all)
                
                Section {
                    ScrollingRowView(scrollOptions: .trending)
                } header: {
                    Text("Top Airing")
                        .font(.title2.bold())
                }
                .listSectionSeparatorTint(.clear,edges: .all)
          
                Section {
                    CategoryRow()
                        .frame(height: 300)
                } header: {
                    Text("Popular")
                        .font(.title2.bold())
                }
                .listSectionSeparatorTint(.clear,edges: .all)
            }
            .listStyle(.plain)

            .ignoresSafeArea()
        }
    }
}



struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
        
    }
}


extension DiscoveryView{
    func blockText(text: String, alignment: Alignment, geo: CGSize) -> some View{
        Text(text)
            .frame(width: geo.width * 0.3, height: geo.height * 0.15, alignment: alignment)
            .font(.system(size: 300))
            .minimumScaleFactor(0.01)
            .bold()
            .padding(5)
    }
    var searchBar: some View{
        HStack{
            Spacer()
            HStack{
                Image(systemName: "magnifyingglass")
                    .bold()
                Text("Search")
            }
            .foregroundColor(.white)
            .padding(10)
            .background(.black, in: Capsule(style: .continuous))
        }
    }
    
    var filterCapsules : some View{
        GeometryReader { geo in
            VStack{
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(genre.listGenres(genreType: .theme), id: \.self) { genre in
                            blockText(text: genre, alignment: .center, geo: geo.size)
                                .background(.white, in: Capsule(style: .continuous))
                            
                        }
                    }
                }
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(genre.listGenres(genreType: .genre), id: \.self) { genre in
                            blockText(text: genre, alignment: .center, geo: geo.size)
                                .background(
                                    Capsule(style: .continuous)
                                        .stroke(lineWidth: 1)
                                )
                        }
                    }
                }
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(genre.listGenres(genreType: .demographics), id: \.self) { genre in
                            blockText(text: genre, alignment: .center, geo: geo.size)
                                .foregroundStyle(.white)
                                .background(.black, in: Capsule(style: .continuous))
                            
                        }
                    }
                }
            }
        }
        .frame( height: 180)
    }
}


