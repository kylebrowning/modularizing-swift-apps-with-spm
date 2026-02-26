import Foundation
import SwiftUI
import Toolkit

/// Stub service for schedule operations. Will be fully implemented in a future post.
public struct ScheduleService: Sendable {
    public var fetchSchedule: @Sendable () async throws -> String

    public init(
        fetchSchedule: @escaping @Sendable () async throws -> String
    ) {
        self.fetchSchedule = fetchSchedule
    }
}

extension ScheduleService {
    public static func live(
        client: NetworkClient,
        baseURL: URL
    ) -> ScheduleService {
        ScheduleService(
            fetchSchedule: { "Live Schedule" }
        )
    }

    public static let mock = ScheduleService(
        fetchSchedule: { "Mock Schedule" }
    )

    public static let unimplemented = ScheduleService(
        fetchSchedule: { fatalError("fetchSchedule unimplemented") }
    )
}

extension EnvironmentValues {
    @Entry public var scheduleService: ScheduleService = .unimplemented
}
