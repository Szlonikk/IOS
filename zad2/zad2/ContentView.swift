//
//  ContentView.swift
//  zad2
//
//  Created by user279421 on 11/28/25.
//

import SwiftUI

struct Task: Identifiable{
    let id=UUID()
    let title: String
}

struct ContentView: View {
    let tasks: [Task] = [
        Task(title: "Eat breakfast"),
        Task(title: "Eat lunch"),
        Task(title: "Eat diner"),
        Task(title: "Eat super"),
        Task(title: "Go to sleep"),
    ]
    
    var body: some View {
        NavigationView {
            List(tasks) {task in Text(task.title)
            }
            .navigationTitle("To do list")
        }
    }
}

#Preview {
    ContentView()
}

