import Foundation

final class CounterStore: ObservableObject {
    @Published private(set) var value: Int = 0

    func increment() { value += 1 }
    func decrement() { value -= 1 }
    func reset() { value = 0 }
}
