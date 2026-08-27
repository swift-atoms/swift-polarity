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
    func `Opposite inverts charge and preserves neutrality`() {
        #expect(Polarity.opposite(of: .positive) == .negative)
        #expect(Polarity.opposite(of: .negative) == .positive)
        #expect(Polarity.opposite(of: .neutral) == .neutral)
        #expect(!Polarity.positive == .negative)
    }
}
