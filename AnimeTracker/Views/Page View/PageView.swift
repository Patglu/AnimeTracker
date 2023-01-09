
import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage : Int?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 5))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: TempData().topAiring.data.map{DiscoveryCard(info: $0)})
            .aspectRatio(3 / 4, contentMode: .fit)

    }
}
