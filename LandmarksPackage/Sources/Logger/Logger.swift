import Foundation

/// Thin wrapper for consistent logging across modules.
public struct AppLogger: Sendable {
    public let category: String

    public init(category: String) {
        self.category = category
    }

    public func info(_ message: String) {
        print("[\(category)] INFO: \(message)")
    }

    public func error(_ message: String) {
        print("[\(category)] ERROR: \(message)")
    }

    public func debug(_ message: String) {
        #if DEBUG
        print("[\(category)] DEBUG: \(message)")
        #endif
    }
}
