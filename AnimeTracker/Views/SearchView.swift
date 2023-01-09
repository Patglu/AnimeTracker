import SwiftUI

struct SearchView: View {
    @ObservedObject var animeNetworking = AnimeViewModel()
    @FocusState var isSearching:Bool
    @State var searchedText:String = ""
    @State  var isSearchFocused: Bool = false
    var body: some View {
        ScrollView {
            searchTextField
            VStack(alignment: .leading){
                ForEach(animeNetworking.searchedAnime?.data ?? Searched(data: []).data, id: \.self) { searched in
                    Text(searched.title)
                        .padding()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension SearchView{
    var searchTextField: some View{
        HStack {
            TextField("Enter area name", text: $searchedText)
                .padding()
                .frame(width: 300, height: 50)
                .focused($isSearching)
                .background(
                    Capsule(style: .continuous)
                        .stroke(lineWidth: 0.5)
                )
                .onSubmit {
                    if searchedText.isEmpty{
                        Alert(
                            title: Text("Enter a anime")
                        )
                    }else{
                        animeNetworking.getSearchedItems(searchedText.trimmingCharacters(in: .whitespaces))
                    }
                }
                .submitLabel(.search)
            Image(systemName: "magnifyingglass")
                .font(.title)
        }
    }
}
