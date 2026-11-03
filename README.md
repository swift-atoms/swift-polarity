# swift-polarity

Use this package when a value has one of two opposed charges, positive or negative, and the only operation you need is flipping it, optionally carrying a payload tagged with that charge. Start from `Polarity`, and from `Polarity.Value<Payload>` when the charge travels with a value. When the two cases are an orientation along an axis that needs a numeric sign or an ordering of negative before positive, use swift-direction instead; `Polarity` has neither.

## Laws

- `Polarity.opposite` is an involution: taking the opposite twice returns the original value, and the two cases are each other's opposite.
- `!` is `Polarity.opposite`; it carries no Boolean meaning beyond flipping the charge.
- `Polarity.allCases` lists `.positive` before `.negative`.
