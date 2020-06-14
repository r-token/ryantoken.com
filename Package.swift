// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "RyantokenCom",
    products: [
        .executable(name: "RyantokenCom", targets: ["RyantokenCom"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "RyantokenCom",
            dependencies: ["Publish"]
        )
    ]
)
