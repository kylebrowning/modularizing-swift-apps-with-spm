import LandmarksApi

extension LandmarkApiModel {
    public var domainModel: Landmark? {
        guard let category = Category(rawValue: category) else {
            return nil
        }
        return Landmark(
            id: id,
            name: name,
            category: category,
            city: city,
            state: state,
            isFeatured: isFeatured,
            isFavorite: isFavorite,
            park: park,
            description: description,
            imageName: imageName,
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
