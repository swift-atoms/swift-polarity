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
            name: "Polarity Standard Library Integration",
            targets: ["Polarity Standard Library Integration"]
        ),
        .library(
            name: "Polarity Apple Foundation Integration",
            targets: ["Polarity Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Polarity",
            dependencies: []
        ),
        .target(
            name: "Polarity Standard Library Integration",
            dependencies: ["Polarity"]
        ),
        .target(
            name: "Polarity Apple Foundation Integration",
            dependencies: [
                "Polarity",
                "Polarity Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Polarity Tests",
            dependencies: ["Polarity"],
            path: "Tests/Polarity Tests"
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
