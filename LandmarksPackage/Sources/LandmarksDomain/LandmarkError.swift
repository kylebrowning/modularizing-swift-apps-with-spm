import Foundation

public enum LandmarkError: Error, LocalizedError {
    case notFound
    case invalidData
    case networkError(Error)

    public var errorDescription: String? {
        switch self {
        case .notFound:
            return "Landmark not found."
        case .invalidData:
            return "The landmark data was invalid."
        case .networkError(let error):
            return error.localizedDescription
        }
    }
}
