import SwiftUI

struct SavedAnimeView: View {
    @StateObject var vm = DataController()
    var body: some View {
        VStack{
            Text("Saved Anime")
                .font(.largeTitle)
                .bold()
                .hLeading()
                .padding(.leading)
            List {
                ForEach(vm.savedAnime) { ani in
                        Text(ani.title ?? "No Added Anime")
                            .padding()
                }
                .onDelete(perform: vm.removeAnime)
            }
            
            
        }
    }
}

struct SavedAnimeView_Previews: PreviewProvider {
    static var previews: some View {
        SavedAnimeView()
        
    }
}
