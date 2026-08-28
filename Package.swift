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
        .library(
            name: "Polarity",
            targets: ["Polarity"]
        ),
        .library(
            name: "Polarity Test Support",
            targets: ["Polarity Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-pair.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Polarity",
            dependencies: [
                .product(name: "Pair", package: "swift-pair")
            ]
        ),
        .target(
            name: "Polarity Test Support",
            dependencies: [
                "Polarity"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Polarity Tests",
            dependencies: [
                "Polarity",
                "Polarity Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
