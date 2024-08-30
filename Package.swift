// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "fluent-mongo-driver",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "FluentMongoDriver", targets: ["FluentMongoDriver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/fluent-kit.git", from: "1.37.0"),
        .package(path: "../MongoKitten"),
//        .package(url: "https://github.com/orlandos-nl/MongoKitten.git", from: "6.7.13"),
        .package(url: "https://github.com/orlandos-nl/DNSClient.git", exact: "2.3.0"),
    ],
    targets: [
        .target(
            name: "FluentMongoDriver",
            dependencies: [
                .product(name: "FluentKit", package: "fluent-kit"),
                .product(name: "MongoKitten", package: "MongoKitten"),
                .product(name: "DNSClient", package: "DNSClient"),
            ]
        ),
        .testTarget(
            name: "FluentMongoDriverTests",
            dependencies: [
                .target(name: "FluentMongoDriver"),
                .product(name: "FluentBenchmark", package: "fluent-kit"),
            ]
        ),
    ]
)
