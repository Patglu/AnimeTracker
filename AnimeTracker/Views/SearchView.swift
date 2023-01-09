import SwiftUI

struct SearchView: View {
    @ObservedObject var animeNetworking = AnimeViewModel()
    @StateObject private var vm = DataController()
    @FocusState var isSearching:Bool
    @State var searchedText:String = ""
    @State  var isSearchFocused: Bool = false
    var body: some View {
        ScrollView {
            searchTextField
            VStack(alignment: .leading){
                ForEach(animeNetworking.searchedAnime?.data ?? Searched(data: []).data, id: \.self) { searched in
                    HStack {
                        Text(searched.title)
                            .padding()
                        Button {
                            vm.addAnime(title: searched.title, animeID: searched.malID)
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .background(.black.opacity(0.5), in: Circle())
                        }

                    }
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
