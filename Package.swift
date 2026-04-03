// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MacroMacMockup",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "MacroMacMockup", targets: ["MacroMacMockup"])
    ],
    targets: [
        .executableTarget(
            name: "MacroMacMockup",
            path: "Sources/MacroMacMockup"
        )
    ]
)
