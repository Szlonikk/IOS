import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        VStack(spacing: 20) {
            Text("Shoping List")
                .font(.title)

            Button("Add") {
                addExampleData()
            }
        }
        .padding()
    }

    private func addExampleData() {
        let fruits = Category(context: viewContext)
        fruits.categoryName = "Fruits"

        let banana = Product(context: viewContext)
        banana.name = "Banana"
        banana.quantity = 6
        banana.isBought = false
        banana.category = fruits

        do {
            try viewContext.save()
            print("Category and Product saved")
        } catch {
            print("Save error: \(error.localizedDescription)")
        }
    }
}
