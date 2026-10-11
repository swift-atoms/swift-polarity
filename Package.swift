// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-polarity",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Polarity", targets: ["Polarity"]),

        .library(name: "Polarity Foundation Integration", targets: ["Polarity Foundation Integration"]),
        .library(name: "Polarity Test Support", targets: ["Polarity Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-pair.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Polarity",
            dependencies: [
                .product(name: "Pair", package: "swift-pair"),
            ],
            path: "Sources/Polarity"
        ),
        
        .target(
            name: "Polarity Foundation Integration",
            dependencies: [
                .target(name: "Polarity"),
            ],
            path: "Sources/Polarity Foundation Integration"
        ),
        .target(
            name: "Polarity Test Support",
            dependencies: [
                .target(name: "Polarity"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Polarity Tests",
            dependencies: [
                .target(name: "Polarity"),
                .target(name: "Polarity Test Support"),
            ],
            path: "Tests/Polarity Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
