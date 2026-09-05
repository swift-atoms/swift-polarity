import Pair
import Polarity
import Testing

@Suite
struct `Polarity Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Polarity Tests`.Unit {

    @Test
    func `Polarity is binary and opposite is involutive`() {
        #expect(Polarity.allCases == [.positive, .negative])
        #expect(Polarity.positive.opposite == .negative)
        #expect(Polarity.negative.opposite == .positive)
        #expect(!(!Polarity.positive) == .positive)
    }

    @Test
    func `Polarity Value typealias resolves through Pair`() {
        let value: Polarity.Value<Int> = Pair(.positive, 4)
        #expect(value.first == .positive)
        #expect(value.second == 4)
    }
}
