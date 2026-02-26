import Foundation

/// Minimal environment configuration for the app.
public struct Env: Sendable {
    public let baseURL: URL

    public init(baseURL: URL) {
        self.baseURL = baseURL
    }

    public static let production = Env(
        baseURL: URL(string: "https://api.example.com")!
    )

    public static let development = Env(
        baseURL: URL(string: "http://localhost:8080")!
    )
}
