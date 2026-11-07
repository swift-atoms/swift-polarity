import Polarity
import Testing

@Suite
struct `Polarity Pair Tests` {
    @Suite struct Unit {}
}

extension `Polarity Pair Tests`.Unit {

    @Test
    func `Polarity Value typealias resolves through Pair`() {
        let value: Polarity.Value<Int> = Pair(.positive, 4)
        #expect(value.first == .positive)
        #expect(value.second == 4)
    }

    @Test
    func `Polarity Value preserves noncopyable Pair payloads`() {
        struct Payload: ~Copyable {
            let rawValue: Int
        }

        let value: Polarity.Value<Payload> = Pair(.negative, Payload(rawValue: 7))
        #expect(value.first == .negative)
        #expect(value.second.rawValue == 7)
    }
}
