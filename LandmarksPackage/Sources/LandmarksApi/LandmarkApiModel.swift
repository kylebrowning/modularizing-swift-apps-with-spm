public struct LandmarkApiModel: ApiModel {
    public let id: Int
    public let name: String
    public let category: String
    public let city: String
    public let state: String
    public let isFeatured: Bool
    public let isFavorite: Bool
    public let park: String
    public let description: String
    public let imageName: String
    public let coordinates: CoordinatesApiModel
}

public struct CoordinatesApiModel: ApiModel {
    public let latitude: Double
    public let longitude: Double
}
