// swift-tools-version:4.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmokeFramework",
    products: [
        .library(
            name: "SmokeOperations",
            targets: ["SmokeOperations"]),
        .library(
            name: "SmokeOperationsHTTP1",
            targets: ["SmokeOperationsHTTP1"]),
        .library(
            name: "SmokeHTTP1",
            targets: ["SmokeHTTP1"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/LoggerAPI.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/apple/swift-nio.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SmokeHTTP1",
            dependencies: ["NIO", "NIOHTTP1", "LoggerAPI"]),
        .target(
            name: "SmokeOperations",
            dependencies: ["LoggerAPI"]),
        .target(
            name: "SmokeOperationsHTTP1",
            dependencies: ["SmokeOperations", "SmokeHTTP1"]),
        .testTarget(
            name: "SmokeOperationsHTTP1Tests",
            dependencies: ["SmokeOperationsHTTP1"]),
    ]
)
