//
//  zad3App.swift
//  zad3
//
//  Created by user279421 on 12/7/25.
//

import SwiftUI

@main
struct zad3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
