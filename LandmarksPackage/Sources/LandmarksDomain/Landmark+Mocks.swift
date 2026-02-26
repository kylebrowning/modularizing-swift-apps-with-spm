extension Landmark {
    public static let mocks: [Landmark] = [
        Landmark(
            id: 1001,
            name: "Turtle Rock",
            category: .rivers,
            city: "Twentynine Palms",
            state: "California",
            isFeatured: true,
            isFavorite: false,
            park: "Joshua Tree National Park",
            description: "Nestled in the California desert, Turtle Rock is a distinctive formation in Joshua Tree National Park.",
            imageName: "turtlerock",
            latitude: 34.011_286,
            longitude: -116.166_868
        ),
        Landmark(
            id: 1002,
            name: "Silver Salmon Creek",
            category: .lakes,
            city: "Port Alsworth",
            state: "Alaska",
            isFeatured: false,
            isFavorite: true,
            park: "Lake Clark National Park and Preserve",
            description: "Silver Salmon Creek offers pristine wilderness and incredible wildlife viewing opportunities.",
            imageName: "silversalmoncreek",
            latitude: 59.980_167,
            longitude: -152.665_167
        ),
        Landmark(
            id: 1003,
            name: "Chilkoot Trail",
            category: .mountains,
            city: "Skagway",
            state: "Alaska",
            isFeatured: false,
            isFavorite: false,
            park: "Klondike Gold Rush National Historical Park",
            description: "The Chilkoot Trail retraces the steps of gold rush stampeders through rugged mountain terrain.",
            imageName: "chilkoottrail",
            latitude: 59.560_229,
            longitude: -135.334_571
        ),
        Landmark(
            id: 1004,
            name: "Lake Umbagog",
            category: .lakes,
            city: "Errol",
            state: "New Hampshire",
            isFeatured: true,
            isFavorite: true,
            park: "Umbagog National Wildlife Refuge",
            description: "Lake Umbagog is a remote wilderness lake on the Maine-New Hampshire border.",
            imageName: "umbagog",
            latitude: 44.747_324,
            longitude: -71.056_960
        ),
    ]
}
