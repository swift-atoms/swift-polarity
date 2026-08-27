public import Polarity

extension Polarity: CaseIterable {

    public static var allCases: [Polarity] {
        [.positive, .negative, .neutral]
    }
}
