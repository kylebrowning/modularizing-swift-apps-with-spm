import Foundation

public struct Landmark: DomainModel, Identifiable {
    public let id: Int
    public let name: String
    public let category: Category
    public let city: String
    public let state: String
    public let isFeatured: Bool
    public var isFavorite: Bool
    public let park: String
    public let description: String
    public let imageName: String
    public let latitude: Double
    public let longitude: Double

    public init(
        id: Int,
        name: String,
        category: Category,
        city: String,
        state: String,
        isFeatured: Bool,
        isFavorite: Bool,
        park: String,
        description: String,
        imageName: String,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.city = city
        self.state = state
        self.isFeatured = isFeatured
        self.isFavorite = isFavorite
        self.park = park
        self.description = description
        self.imageName = imageName
        self.latitude = latitude
        self.longitude = longitude
    }
}

public enum Category: String, CaseIterable, Sendable {
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
}
