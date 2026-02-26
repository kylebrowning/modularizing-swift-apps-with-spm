/// Marker protocol for all API response/request models.
/// Ensures consistent conformances across the Api layer.
public protocol ApiModel: Codable, Hashable, Sendable {}
