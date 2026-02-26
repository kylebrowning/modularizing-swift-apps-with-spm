import Foundation
import LandmarksApi
import Toolkit

public struct LandmarkService: Sendable {
    public var fetchLandmarks: @Sendable () async throws -> [Landmark]
    public var fetchLandmark: @Sendable (Int) async throws -> Landmark
    public var fetchLandmarksByCategory: @Sendable (Category) async throws -> [Landmark]
    public var toggleFavorite: @Sendable (Int) async throws -> Landmark

    public init(
        fetchLandmarks: @escaping @Sendable () async throws -> [Landmark],
        fetchLandmark: @escaping @Sendable (Int) async throws -> Landmark,
        fetchLandmarksByCategory: @escaping @Sendable (Category) async throws -> [Landmark],
        toggleFavorite: @escaping @Sendable (Int) async throws -> Landmark
    ) {
        self.fetchLandmarks = fetchLandmarks
        self.fetchLandmark = fetchLandmark
        self.fetchLandmarksByCategory = fetchLandmarksByCategory
        self.toggleFavorite = toggleFavorite
    }
}

// MARK: - Live

extension LandmarkService {
    public static func live(
        client: NetworkClient,
        baseURL: URL
    ) -> LandmarkService {
        LandmarkService(
            fetchLandmarks: {
                let apiModels = try await client.get(
                    baseURL, LandmarkEndpoints.list()
                )
                return apiModels.compactMap(\.domainModel)
            },
            fetchLandmark: { id in
                let apiModel = try await client.get(
                    baseURL, LandmarkEndpoints.get(id: id)
                )
                guard let landmark = apiModel.domainModel else {
                    throw LandmarkError.invalidData
                }
                return landmark
            },
            fetchLandmarksByCategory: { category in
                let apiModels = try await client.get(
                    baseURL, LandmarkEndpoints.byCategory(category.rawValue)
                )
                return apiModels.compactMap(\.domainModel)
            },
            toggleFavorite: { id in
                let apiModel = try await client.put(
                    baseURL, LandmarkEndpoints.toggleFavorite(id: id)
                )
                guard let landmark = apiModel.domainModel else {
                    throw LandmarkError.invalidData
                }
                return landmark
            }
        )
    }
}

// MARK: - Mock

extension LandmarkService {
    public static let mock = LandmarkService(
        fetchLandmarks: {
            try? await Task.sleep(for: .milliseconds(200))
            return Landmark.mocks
        },
        fetchLandmark: { id in
            try? await Task.sleep(for: .milliseconds(100))
            guard let landmark = Landmark.mocks.first(
                where: { $0.id == id }
            ) else {
                throw LandmarkError.notFound
            }
            return landmark
        },
        fetchLandmarksByCategory: { category in
            try? await Task.sleep(for: .milliseconds(150))
            return Landmark.mocks.filter { $0.category == category }
        },
        toggleFavorite: { id in
            try? await Task.sleep(for: .milliseconds(100))
            guard var landmark = Landmark.mocks.first(
                where: { $0.id == id }
            ) else {
                throw LandmarkError.notFound
            }
            landmark.isFavorite.toggle()
            return landmark
        }
    )

    public static let unimplemented = LandmarkService(
        fetchLandmarks: { fatalError("fetchLandmarks unimplemented") },
        fetchLandmark: { _ in fatalError("fetchLandmark unimplemented") },
        fetchLandmarksByCategory: { _ in
            fatalError("fetchLandmarksByCategory unimplemented")
        },
        toggleFavorite: { _ in fatalError("toggleFavorite unimplemented") }
    )
}
