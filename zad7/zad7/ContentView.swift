import SwiftUI

struct ContentView: View {
    @StateObject private var store = CounterStore()

    var body: some View {
        VStack(spacing: 20) {
            Text("Counter")
                .font(.title)

            Text("\(store.value)")
                .font(.system(size: 60, weight: .bold))

            HStack(spacing: 20) {
                Button("-") { store.decrement() }
                    .font(.title)

                Button("Reset") { store.reset() }

                Button("+") { store.increment() }
                    .font(.title)
            }
        }
        .padding()
    }
}
