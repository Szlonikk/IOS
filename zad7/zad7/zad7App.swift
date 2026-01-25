//
//  zad7App.swift
//  zad7
//
//  Created by user279421 on 1/25/26.
//

import SwiftUI

@main
struct zad7App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
