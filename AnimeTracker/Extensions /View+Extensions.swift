import SwiftUI

extension View{
    func hLeading() -> some View{
        self
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    func hTrailing() -> some View{
        self
            .frame(maxWidth: .infinity,alignment: .trailing)
    }
    
    func hCenter() -> some View{
        self
            .frame(maxWidth: .infinity,alignment: .center)
    }
    
    func vTop() -> some View{
        self
            .frame(maxHeight: .infinity, alignment: .top)
    }

    func topRight() -> some View{
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topTrailing)
    }

}

