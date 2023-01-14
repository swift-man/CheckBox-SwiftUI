// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CheckListView",
    platforms: [
      .macOS(.v12),
      .iOS(.v15)
    ],
    products: [
      .library(
        name: "CheckListView",
        type: .static,
        targets: ["CheckListView"]),
    ],
    dependencies: [
      .package(url: "https://github.com/swift-man/IdentifiableIndices.git", from: "0.5.0"),
    ],
    targets: [
      .target(
        name: "CheckListView",
        dependencies: [
          "IdentifiableIndices",
        ],
        path: "Sources/CheckListView",
        exclude: ["Info.plist"]),
    ]
)
