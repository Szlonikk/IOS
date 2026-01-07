//
//  zad5App.swift
//  zad5
//
//  Created by user279421 on 1/7/26.
//

import SwiftUI

@main
struct zad5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
