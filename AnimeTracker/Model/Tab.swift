import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab:Tab
    var color: Color
}

enum Tab: String, CaseIterable{
    case library
    case explore
    case search
}

struct TabPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension TabItem{
    static var tabItems = [
        TabItem(text: "Library", icon: "books.vertical.fill",tab: .library,color: Color(hex: "ae2012")),
        TabItem(text: "Explore", icon: "globe.desk.fill",tab: .explore,color: Color(hex: "bb3e03")),
        TabItem(text: "Search", icon: "sparkle.magnifyingglass",tab: .search,color: Color(hex: "ca6702"))
    ]
}

