import SwiftUI

struct CategoryRow: View {
    let layout = [
        GridItem(.fixed(90)),
        GridItem(.fixed(90)),
        GridItem(.fixed(90))
    ]
    @ObservedObject var discoveryViewModel = AnimeViewModel()
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading){
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout) {
                        ForEach(discoveryViewModel.popularAnime.data, id: \.self){ item in
                            HStack {
                                AsyncImage(url: URL(string: item.image ?? "")){ image in
                                    image
                                        .resizable()
                                        .aspectRatio(3/4,contentMode: .fill)
                                        .frame(width: 150, height: 80)
                                        .padding(.horizontal,5)
                                        .cornerRadius(10)

                                } placeholder: {
                                    ProgressView()
                                }
                                VStack(alignment: .leading){
                                    Text(item.titleEnglish)
                                    Text("Genre: \(item.genres.first?.name ?? "")")
                                        .font(.caption)
                                }
                            }
                            .frame(width: geo.size.width ,alignment: .leading)
                            
                        }
                    }
                }
               Spacer()
                    .frame(height: 200)
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
    }
}
