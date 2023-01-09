import Foundation
import SwiftUI

struct DetailSubTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.bold)
            .padding(.bottom, 4)
            .hLeading()
    }
}

extension View{
    func subTitleStyle() -> some View {
            modifier(DetailSubTitle())
        }
}
