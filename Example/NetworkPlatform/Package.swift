// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkPlatform",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NetworkPlatform",
            targets: ["NetworkPlatform"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0"),
        .package(url: "https://github.com/RxSwiftCommunity/RxAlamofire.git", from: "6.1.0")
    ],

    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NetworkPlatform",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "RxAlamofire", package: "RxAlamofire")
            ],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"]),
            ]
        )
    ]
)
