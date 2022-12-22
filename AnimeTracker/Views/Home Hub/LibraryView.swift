import SwiftUI

struct LibraryView: View {
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                Text("Library")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                HStack {
                    Rect()
                        .overlay {
                            HStack {
                                blockText(text: "Anime", alignment: .bottomLeading,geo: geo.size)
                                Spacer()
                            }
                        }
                    
                    Rect()
                        .frame(width: geo.size.width * 0.315)
                        .cornerRadius(10)
                }
                .frame(height: geo.size.height * 0.2)
                HStack {
                    Rect()
                        .frame(width: geo.size.width * 0.315)
                        .cornerRadius(10)
                    Rect()
                        .overlay {
                            HStack {
                                Spacer()
                                blockText(text: "Manga", alignment: .bottomTrailing,geo: geo.size)
                            }
                        }
                }
                .frame(height: geo.size.height * 0.2)
                Text("Recently Viewed")
                    .hTrailing()
                    .bold()
                HStack{
                    ForEach(0 ..< 4) { item in
                        Rect()
                            .frame(width: geo.size.width * 0.09)
                    }
                    Rect()
                }
                .frame(height: geo.size.height * 0.2)
                Text("Genres")
                    .hTrailing()
                    .bold()
                HStack{
                    ForEach(0 ..< 5) { item in
                        Rect()
                            .frame(width: geo.size.width / 5.5)
                    }
                }
                .frame(height: geo.size.height * 0.2)
        
            }
        }
        .padding()
    }
}

extension LibraryView{
    func blockText(text: String, alignment: Alignment, geo: CGSize) -> some View{
            Text(text)
                .frame(width: geo.width * 0.5, height: geo.height * 0.2, alignment: alignment)
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
            .bold()
            .padding()
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

struct Rect:View{
    var body: some View{
        Rectangle()
            .fill(.green)
        
    }
}
