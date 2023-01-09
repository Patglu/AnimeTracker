import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab:Tab = .explore
    @State var color: Color = Color(hex: "a0c4ff")
    @State var tabItemWidth: CGFloat = .zero
    
    var body: some View {
        
        HStack {
            Buttons
        }
        
        .padding(.horizontal,8)
        .padding(.top,14)
        .frame(height: 88, alignment: .top)
        //MARK: - Background effect
        .background(.ultraThinMaterial, in: Rectangle())
        .frame(maxHeight:.infinity,alignment: .bottom) ///allows the fame to take the max height and
        .ignoresSafeArea()
    }
    var Buttons: some View{
        ForEach(TabItem.tabItems) { item in
            Button{
                //MARK: - Tab bar button animation
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)){
                    selectedTab = item.tab
                    color = item.color
                }
            } label: {
                VStack(spacing:0){
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.title)
                        .frame(width: 44, height: 35)
                    Text(item.text)
                        .font(.caption)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(selectedTab == item.tab ? item.color: .secondary.opacity(0.7))
            }
            .animation(Animation.easeInOut(duration: 0.5), value: selectedTab)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewInterfaceOrientation(.portrait)
    }
}
