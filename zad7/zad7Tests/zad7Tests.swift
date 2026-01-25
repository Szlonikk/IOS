import XCTest
@testable import zad7

final class CounterStoreTests: XCTestCase {

    func test_1() {
        let s = CounterStore()
        XCTAssertEqual(s.value, 0)
    }

    func test_2() {
        let s = CounterStore()
        s.increment()
        XCTAssertEqual(s.value, 1)
    }

    func test_3() {
        let s = CounterStore()
        s.increment()
        s.increment()
        XCTAssertEqual(s.value, 2)
    }

    func test_4() {
        let s = CounterStore()
        s.decrement()
        XCTAssertEqual(s.value, -1)
    }

    func test_5() {
        let s = CounterStore()
        s.increment()
        s.reset()
        XCTAssertEqual(s.value, 0)
    }

    func test_6() {
        let s = CounterStore()
        s.decrement()
        s.reset()
        XCTAssertEqual(s.value, 0)
    }

    func test_7() {
        let s = CounterStore()
        s.increment()
        s.increment()
        s.decrement()
        XCTAssertEqual(s.value, 1)
    }

    func test_8() {
        let s = CounterStore()
        s.increment()
        s.increment()
        s.reset()
        XCTAssertEqual(s.value, 0)

        s.decrement()
        s.reset()
        XCTAssertEqual(s.value, 0)
    }

    func test_9() {
        let s = CounterStore()
        for _ in 0..<10 { s.increment() }
        XCTAssertEqual(s.value, 10)
    }

    func test_10() {
        let s = CounterStore()
        for _ in 0..<7 { s.decrement() }
        XCTAssertEqual(s.value, -7)
    }

    func test_11() {
        let s = CounterStore()
        s.increment()
        s.decrement()
        XCTAssertEqual(s.value, 0)
    }

    func test_12() {
        let s = CounterStore()
        s.decrement()
        s.increment()
        XCTAssertEqual(s.value, 0)
    }

    func test_13() {
        let s = CounterStore()
        s.increment()
        s.increment()
        s.increment()
        XCTAssertEqual(s.value, 3)
    }

    func test_14() {
        let s = CounterStore()
        s.decrement()
        s.decrement()
        XCTAssertEqual(s.value, -2)
    }

    func test_15() {
        let s = CounterStore()
        s.increment()
        s.decrement()
        s.decrement()
        XCTAssertEqual(s.value, -1)
    }

    func test_16() {
        let s = CounterStore()
        for _ in 0..<100 { s.increment() }
        XCTAssertEqual(s.value, 100)
        s.reset()
        XCTAssertEqual(s.value, 0)
    }

    func test_17() {
        let s = CounterStore()
        XCTAssertTrue(s.value is Int)
    }

    func test_18() {
        let s = CounterStore()
        s.increment()
        XCTAssertGreaterThan(s.value, 0)
        XCTAssertLessThan(s.value, 2)
    }

    func test_19() {
        let s = CounterStore()
        s.decrement()
        XCTAssertLessThan(s.value, 0)
        XCTAssertGreaterThan(s.value, -2)
    }

    func test_20() {
        let s = CounterStore()
        s.increment()
        s.reset()
        XCTAssertEqual(s.value, 0)
    }

    func test_21() {
        let s = CounterStore()
        XCTAssertNotEqual(s.value, 1)
    }

    func test_22() {
        let s = CounterStore()
        s.increment()
        s.increment()
        XCTAssertNotEqual(s.value, 0)
    }

    func test_23() {
        let s = CounterStore()
        s.increment()
        s.increment()
        s.reset()
        XCTAssertEqual(s.value, 0)
    }

    func test_24() {
        let s = CounterStore()
        let before = s.value
        s.increment()
        XCTAssertNotEqual(s.value, before)
    }

    func test_25() {
        let s = CounterStore()
        let before = s.value
        s.decrement()
        XCTAssertNotEqual(s.value, before)
    }

    func test_26() {
        let s = CounterStore()
        s.increment()
        s.reset()
        XCTAssertEqual(s.value, 0)
    }
}
    func test_27() {
        let s = CounterStore()
        for _ in 0..<7 { s.decrement() }
        XCTAssertEqual(s.value, -7)
    }

    func test_28() {
        let s = CounterStore()
        s.increment()
        s.decrement()
        XCTAssertEqual(s.value, 0)
    }

    func test_29() {
        let s = CounterStore()
        s.decrement()
        s.increment()
        XCTAssertEqual(s.value, 0)
    }

    func test_30() {
        let s = CounterStore()
        s.increment()
        s.increment()
        s.increment()
        XCTAssertEqual(s.value, 3)
    }
