// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwifterCommon",
    platforms: [
        .iOS(.v15),
        .macOS(.v13),
        .watchOS(.v9)
    ],
    products: [
        // base
        .library(
            name: "SwifterCommon",
            targets: ["SwifterCommon"]),
        .library(
            name: "SwifterCommon-Toast",
            targets: ["SwifterCommon-Toast"])
    ],
    dependencies: [
        .package(url: "https://github.com/exyte/PopupView", .upToNextMajor(from: "4.1.14"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwifterCommon"),
        .target(name: "SwifterCommon-Toast", dependencies: [
            "SwifterCommon",
            .product(name: "PopupView", package: "PopupView")
        ])
    ]
)
