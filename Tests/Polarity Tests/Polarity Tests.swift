import Pair
import Polarity
import Testing

@Suite
struct `Polarity preserves binary opposites and paired values` {
    @Suite struct `Polarity preserves binary opposites and paired values in their public representations` {}
    @Suite struct `No additional polarity edge cases are defined` {}
    @Suite struct `No additional polarity integration cases are defined` {}
}

extension `Polarity preserves binary opposites and paired values`.`Polarity preserves binary opposites and paired values in their public representations` {

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
