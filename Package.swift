// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "RefRepoKit",
    products: [
        .library(name: "RefRepoKit", targets: ["RefRepoKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.3.0"),
        .package(url: "https://github.com/Einstore/ShellKit.git", from: "1.4.0"),
        .package(url: "https://github.com/Einstore/WebErrorKit.git", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "RefRepoKit",
            dependencies: [
                "CommandKit"
            ]
        ),
        .target(
            name: "RefRepoKitMocks",
            dependencies: [
                "RefRepoKit",
                "WebErrorKit"
            ]
        ),
        .testTarget(
            name: "RefRepoKitTests",
            dependencies: ["RefRepoKit", "NIO", "CommandKit", "ExecutorMocks"]
        ),
        .testTarget(
            name: "RefRepoKitRealTests",
            dependencies: ["RefRepoKit", "NIO", "CommandKit"]
        )
    ]
)


