import Foundation

/// A minimal network client that executes typed `Endpoint` requests.
public struct NetworkClient: Sendable {
    private let session: URLSession
    private let decoder: JSONDecoder

    public init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    public static let `default` = NetworkClient()

    public func get<Response: Decodable & Sendable>(
        _ baseURL: URL,
        _ endpoint: Endpoint<EmptyBody, Response>
    ) async throws -> Response {
        let url = try buildURL(base: baseURL, endpoint: endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        let (data, _) = try await session.data(for: request)
        return try decoder.decode(Response.self, from: data)
    }

    public func put<Response: Decodable & Sendable>(
        _ baseURL: URL,
        _ endpoint: Endpoint<EmptyBody, Response>
    ) async throws -> Response {
        let url = try buildURL(base: baseURL, endpoint: endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        let (data, _) = try await session.data(for: request)
        return try decoder.decode(Response.self, from: data)
    }

    private func buildURL<Body, Response>(
        base: URL,
        endpoint: Endpoint<Body, Response>
    ) throws -> URL {
        var components = URLComponents(
            url: base.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )
        if !endpoint.queryItems.isEmpty {
            components?.queryItems = endpoint.queryItems
        }
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        return url
    }
}

/// Placeholder type for endpoints with no request body.
public struct EmptyBody: Codable, Sendable {}

/// HTTP method.
public enum HTTPMethod: String, Sendable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

/// A typed endpoint definition pairing a path and method with request/response types.
public struct Endpoint<Body: Sendable, Response: Sendable>: Sendable {
    public let path: String
    public let method: HTTPMethod
    public let queryItems: [URLQueryItem]

    public init(
        path: String,
        method: HTTPMethod,
        queryItems: [URLQueryItem] = []
    ) {
        self.path = path
        self.method = method
        self.queryItems = queryItems
    }
}
