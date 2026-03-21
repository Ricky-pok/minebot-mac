// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MacroMacRicky",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "MacroMacRicky", targets: ["MacroMacRicky"])
    ],
    targets: [
        .executableTarget(
            name: "MacroMacRicky"
        ),
        .testTarget(
            name: "MacroMacRickyTests",
            dependencies: ["MacroMacRicky"]
        )
    ]
)
