
import SwiftUI

struct Example1: View {
    @State private var frameWidth: CGFloat = 195
    @State private var frameHeight: CGFloat = 175
    
    
    var body: some View {
        FrameAdjustingContainer(frameWidth: frameWidth, frameHeight: frameHeight) {
            Text("text")
//                .frame(width: frameWidth, height: frameHeight)
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
        }
        
    }
}

struct FrameAdjustingContainer<Content: View>: View {
     var frameWidth: CGFloat
     var frameHeight: CGFloat
        var alignment: Alignment?
    let content: () -> Content
    
    var body: some View  {
        ZStack {
            content()
                .frame(width: frameWidth, height: frameHeight, alignment: alignment ?? .center)
//                .border(Color.red, width: 1)
//
//            VStack {
//                Spacer()
//                Slider(value: $frameWidth, in: 50...300)
//                Slider(value: $frameHeight, in: 50...600)
//            }
            .padding()
        }
    }
}

struct ResizableText_Previews: PreviewProvider {
    static var previews: some View {
        Example1()
    }
}
