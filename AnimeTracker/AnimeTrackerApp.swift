//
//  AnimeTrackerApp.swift
//  AnimeTracker
//
//  Created by Pat on 2022/12/16.
//

import SwiftUI

@main
struct AnimeTrackerApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
