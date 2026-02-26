// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "LandmarksPackage",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        .library(name: "LandmarksDomain", targets: ["LandmarksDomain"]),
        .library(name: "LandmarksFeature", targets: ["LandmarksFeature"]),
    ],
    targets: [
        // Common layer
        .target(name: "Env"),
        .target(name: "Logger"),
        .target(name: "Toolkit"),

        // Api layer
        .target(
            name: "LandmarksApi",
            dependencies: [.env, .toolkit]
        ),

        // Domain layer
        .target(
            name: "LandmarksDomain",
            dependencies: [.landmarksApi, .env, .toolkit]
        ),

        // Feature layer
        .target(
            name: "LandmarksFeature",
            dependencies: [.landmarksDomain, .env, .toolkit]
        ),

        // Tests
        .testTarget(
            name: "LandmarksDomainTests",
            dependencies: [.landmarksDomain]
        ),
    ]
)

// MARK: - Target.Dependency convenience

extension Target.Dependency {
    // Common
    static let env: Target.Dependency = "Env"
    static let logger: Target.Dependency = "Logger"
    static let toolkit: Target.Dependency = "Toolkit"

    // Services
    static let landmarksApi: Target.Dependency = "LandmarksApi"
    static let landmarksDomain: Target.Dependency = "LandmarksDomain"

    // Features
    static let landmarksFeature: Target.Dependency = "LandmarksFeature"
}
