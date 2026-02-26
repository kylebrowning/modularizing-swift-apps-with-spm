import Foundation
import SwiftUI
import Toolkit

public struct ServiceEnvironment: Sendable {
    public let landmarkService: LandmarkService
    public let profileService: ProfileService
    public let scheduleService: ScheduleService

    public init(
        landmarkService: LandmarkService,
        profileService: ProfileService,
        scheduleService: ScheduleService
    ) {
        self.landmarkService = landmarkService
        self.profileService = profileService
        self.scheduleService = scheduleService
    }
}

extension ServiceEnvironment {
    public static func live(
        client: NetworkClient,
        baseURL: URL
    ) -> ServiceEnvironment {
        ServiceEnvironment(
            landmarkService: .live(client: client, baseURL: baseURL),
            profileService: .live(client: client, baseURL: baseURL),
            scheduleService: .live(client: client, baseURL: baseURL)
        )
    }

    public static let mock = ServiceEnvironment(
        landmarkService: .mock,
        profileService: .mock,
        scheduleService: .mock
    )

    public static let unimplemented = ServiceEnvironment(
        landmarkService: .unimplemented,
        profileService: .unimplemented,
        scheduleService: .unimplemented
    )
}

struct ServiceEnvironmentModifier: ViewModifier {
    let environment: ServiceEnvironment

    func body(content: Content) -> some View {
        content
            .environment(\.landmarkService, environment.landmarkService)
            .environment(\.profileService, environment.profileService)
            .environment(\.scheduleService, environment.scheduleService)
    }
}

extension View {
    public func withServiceEnvironment(
        _ environment: ServiceEnvironment
    ) -> some View {
        modifier(ServiceEnvironmentModifier(environment: environment))
    }
}
