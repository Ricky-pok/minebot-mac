// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MacroMac",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "MacroMac", targets: ["MacroMac"])
    ],
    targets: [
        .executableTarget(
            name: "MacroMac"
        ),
        .testTarget(
            name: "MacroMacTests",
            dependencies: ["MacroMac"]
        )
    ]
)
