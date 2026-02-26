import Testing
@testable import LandmarksApi
@testable import LandmarksDomain

@Suite("Landmark API-to-Domain Mapping")
struct LandmarkMappingTests {

    @Test("Valid API model maps to domain model")
    func validMapping() {
        let apiModel = LandmarkApiModel(
            id: 1,
            name: "Turtle Rock",
            category: "Rivers",
            city: "Twentynine Palms",
            state: "California",
            isFeatured: true,
            isFavorite: false,
            park: "Joshua Tree National Park",
            description: "A distinctive formation.",
            imageName: "turtlerock",
            coordinates: CoordinatesApiModel(latitude: 34.0, longitude: -116.0)
        )

        let landmark = apiModel.domainModel

        #expect(landmark != nil)
        #expect(landmark?.id == 1)
        #expect(landmark?.name == "Turtle Rock")
        #expect(landmark?.category == .rivers)
        #expect(landmark?.latitude == 34.0)
        #expect(landmark?.longitude == -116.0)
        #expect(landmark?.isFeatured == true)
        #expect(landmark?.isFavorite == false)
    }

    @Test("Invalid category returns nil")
    func invalidCategory() {
        let apiModel = LandmarkApiModel(
            id: 2,
            name: "Unknown Place",
            category: "Swamps",
            city: "Nowhere",
            state: "Louisiana",
            isFeatured: false,
            isFavorite: false,
            park: "Some Park",
            description: "A place with an unknown category.",
            imageName: "unknown",
            coordinates: CoordinatesApiModel(latitude: 30.0, longitude: -90.0)
        )

        #expect(apiModel.domainModel == nil)
    }

    @Test("Coordinates map correctly")
    func coordinatesMapping() {
        let apiModel = LandmarkApiModel(
            id: 3,
            name: "Silver Salmon Creek",
            category: "Lakes",
            city: "Port Alsworth",
            state: "Alaska",
            isFeatured: false,
            isFavorite: true,
            park: "Lake Clark National Park",
            description: "Pristine wilderness.",
            imageName: "silversalmoncreek",
            coordinates: CoordinatesApiModel(latitude: 59.98, longitude: -152.67)
        )

        let landmark = apiModel.domainModel

        #expect(landmark?.latitude == 59.98)
        #expect(landmark?.longitude == -152.67)
    }
}
