import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable{
    var numberOfPages: Int
    @Binding var currentPage: Int?
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage ?? 0
    }
}
