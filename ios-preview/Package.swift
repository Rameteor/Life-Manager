// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "LifeManagerPreview",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "LifeManagerPreview",
            targets: ["LifeManagerPreview"]
        )
    ],
    targets: [
        .target(name: "LifeManagerPreview")
    ]
)
