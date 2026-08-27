public import Polarity

#if !hasFeature(Embedded)
    extension Polarity: Codable {

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            switch value {
            case "positive": self = .positive
            case "negative": self = .negative
            case "neutral": self = .neutral
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription:
                            "Cannot initialize Polarity from invalid String value \(value)"
                    )
                )
            }
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .positive: try container.encode("positive")
            case .negative: try container.encode("negative")
            case .neutral: try container.encode("neutral")
            }
        }
    }
#endif
