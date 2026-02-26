import Foundation
import SwiftUI
import Toolkit

/// Stub service for profile operations. Will be fully implemented in a future post.
public struct ProfileService: Sendable {
    public var fetchProfile: @Sendable () async throws -> String

    public init(
        fetchProfile: @escaping @Sendable () async throws -> String
    ) {
        self.fetchProfile = fetchProfile
    }
}

extension ProfileService {
    public static func live(
        client: NetworkClient,
        baseURL: URL
    ) -> ProfileService {
        ProfileService(
            fetchProfile: { "Live Profile" }
        )
    }

    public static let mock = ProfileService(
        fetchProfile: { "Mock Profile" }
    )

    public static let unimplemented = ProfileService(
        fetchProfile: { fatalError("fetchProfile unimplemented") }
    )
}

extension EnvironmentValues {
    @Entry public var profileService: ProfileService = .unimplemented
}
