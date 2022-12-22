import SwiftUI

struct ScrollAnimationView: View {
    @State var xOffset: CGFloat = 0
    
    var body: some View {
         GeometryReader { geometry in
             let size = geometry.size.width / 4
             
             InfiniteScroller(contentWidth: size * 4) {
                 HStack(spacing: 0) {
                     ColorView(size: size, color: Color.green)
                     ColorView(size: size, color: Color.white)
                     ColorView(size: size, color: Color.pink)
                     ColorView(size: size, color: Color.cyan)
                 }
             }
         }
     }
}

struct ScrollAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollAnimationView()
    }
}

struct ColorView: View {
    var size: CGFloat
    var color: Color
    
    var body: some View {
        VStack {
            VStack{}.frame(width: size, height: size, alignment: .center)
        }
        .background(color)
    }
}

struct InfiniteScroller<Content: View>: View {
    var contentWidth: CGFloat
    var content: (() -> Content)
    
    @State
    var xOffset: CGFloat = 0

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    content()
                    content()
                }
                .offset(x: xOffset, y: 0)
        }
        .disabled(true)
        .onAppear {
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                xOffset = -contentWidth
            }
        }
    }
}
