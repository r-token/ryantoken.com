// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "RyantokenCom",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "RyantokenCom", targets: ["RyantokenCom"])
    ],
    dependencies: [
        .package(
            name: "Publish",
            url: "https://github.com/johnsundell/publish.git",
            from: "0.9.0")
    ],
    targets: [
        .target(
            name: "RyantokenCom",
            dependencies: ["Publish"]
        )
    ]
)
