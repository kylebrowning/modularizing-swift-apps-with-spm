import Foundation
import Toolkit

public enum LandmarkEndpoints {
    public static func list() -> Endpoint<EmptyBody, [LandmarkApiModel]> {
        Endpoint(path: "/api/landmarks", method: .get)
    }

    public static func get(id: Int) -> Endpoint<EmptyBody, LandmarkApiModel> {
        Endpoint(path: "/api/landmarks/\(id)", method: .get)
    }

    public static func byCategory(
        _ category: String
    ) -> Endpoint<EmptyBody, [LandmarkApiModel]> {
        Endpoint(
            path: "/api/landmarks",
            method: .get,
            queryItems: [URLQueryItem(name: "category", value: category)]
        )
    }

    public static func toggleFavorite(id: Int) -> Endpoint<EmptyBody, LandmarkApiModel> {
        Endpoint(path: "/api/landmarks/\(id)/favorite", method: .put)
    }
}
