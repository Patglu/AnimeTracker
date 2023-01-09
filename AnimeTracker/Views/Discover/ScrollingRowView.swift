import SwiftUI

struct ScrollingRowView: View {
    enum ScrollingViews{
        case recommendations
        case trending
    }
    
    @ObservedObject var discoveryViewModel = AnimeViewModel()
    var scrollOptions: ScrollingViews
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            switch scrollOptions{
            case .recommendations:
                recommendedScroll
            case .trending:
                topAiringScroll
            }
        }
    }
}

extension ScrollingRowView{
    var recommendedScroll: some View{
        HStack {
            ForEach(discoveryViewModel.trendingAnime.data ?? [], id: \.self) { item in
                ForEach(item.entry, id: \.self) {entryItem in
                    AsyncImage(url: URL(string: entryItem.image ?? "")){ image in
                        image
                            .resizable()
                            .aspectRatio(3/4,contentMode: .fill)
                            .frame(width: 100, height: 140)
                            .padding(.horizontal,5)
                            .cornerRadius(10)

                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
    
    var topAiringScroll: some View{
        HStack {
            ForEach(discoveryViewModel.topAiringAnime.data, id: \.self) { item in
                AsyncImage(url: URL(string: item.image ?? "")){ image in
                    image
                        .resizable()
                        .aspectRatio(3/4,contentMode: .fill)
                        .frame(width: 100, height: 140)
                        .padding(.horizontal,5)
                        .cornerRadius(10)

                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
}

struct ScrollingRowVIew_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingRowView(scrollOptions: .recommendations)
    }
}
