import SwiftUI
import LandmarksDomain

public struct LandmarkListView: View {
    @Environment(\.landmarkService) private var service
    @State private var landmarks: [Landmark] = []

    public init() {}

    public var body: some View {
        List(landmarks) { landmark in
            NavigationLink(value: landmark) {
                LandmarkRow(landmark: landmark)
            }
        }
        .navigationTitle("Landmarks")
        .task {
            do {
                landmarks = try await service.fetchLandmarks()
            } catch {
                // handle error
            }
        }
    }
}

struct LandmarkRow: View {
    let landmark: Landmark

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.headline)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    NavigationStack {
        LandmarkListView()
    }
    .environment(\.landmarkService, .mock)
}
