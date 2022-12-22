//
//  TestingDOM.swift
//  AnimeTracker
//
//  Created by Pat on 2022/12/19.
//

import SwiftUI

struct TestingDOM: View {
    var body: some View {
        TestingConcepts().bodyNum2(bod: .collectionview) {
            Text("View")
        }
    }
}

struct TestingDOM_Previews: PreviewProvider {
    static var previews: some View {
        TestingDOM()
    }
}
