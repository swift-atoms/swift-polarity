import Pair
import Polarity_Test_Support
import Testing

@Suite
struct `Polarity Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Polarity Tests`.Unit {

    @Test
    func `Polarity Value typealias resolves through Pair`() {
        let value: Polarity.Value<Int> = Pair(.positive, 4)
        #expect(value.first == .positive)
        #expect(value.second == 4)
    }
}
