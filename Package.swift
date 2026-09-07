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
        .library(name: "Polarity Standard Library Integration", targets: ["Polarity Standard Library Integration"]),
        .library(name: "Polarity Foundation Library Integration", targets: ["Polarity Foundation Library Integration"]),
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
            name: "Polarity Standard Library Integration",
            dependencies: [
                .target(name: "Polarity"),
            ],
            path: "Sources/Polarity Standard Library Integration"
        ),
        .target(
            name: "Polarity Foundation Library Integration",
            dependencies: [
                .target(name: "Polarity"),
                .target(name: "Polarity Standard Library Integration"),
            ],
            path: "Sources/Polarity Foundation Library Integration"
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
                .target(name: "Polarity Standard Library Integration"),
                .target(name: "Polarity Foundation Library Integration"),
            ],
            path: "Tests/Polarity Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
