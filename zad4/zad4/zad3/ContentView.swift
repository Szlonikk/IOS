import SwiftUI
import CoreData
struct ShoppingResponse: Codable {
    let categories: [CategoryDTO]
}

struct CategoryDTO: Codable {
    let name: String
    let products: [ProductDTO]
}

struct ProductDTO: Codable {
    let name: String
    let quantity: Double
    let isBought: Bool
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var statusText: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Shopping List")
                .font(.title)

            Button("Fetch from server") {
                Task {
                    await fetchAndSave()
                }
            }

            Text(statusText)
                .font(.caption)
        }
        .padding()
    }

    private func fetchAndSave() async {
        // ZMIEN jeśli używasz iPhone (wtedy IP komputera w LAN)
        let urlString = "http://127.0.0.1:8000/shopping"

        guard let url = URL(string: urlString) else {
            statusText = "Bad URL"
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ShoppingResponse.self, from: data)

            await viewContext.perform {
                for catDTO in decoded.categories {
                    let category = Category(context: viewContext)
                    category.categoryName = catDTO.name

                    for prodDTO in catDTO.products {
                        let product = Product(context: viewContext)
                        product.name = prodDTO.name
                        product.quantity = prodDTO.quantity
                        product.isBought = prodDTO.isBought
                        product.category = category
                    }
                }

                do {
                    try viewContext.save()
                    statusText = "Saved"
                } catch {
                    statusText = "Save error"
                }
            }

        } catch {
            statusText = "Fetch/decode error"
        }
    }
}
