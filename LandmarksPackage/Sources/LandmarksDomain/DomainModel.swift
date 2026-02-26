/// Marker protocol for all domain models.
/// Ensures consistent conformances across the Domain layer.
public protocol DomainModel: Equatable, Hashable, Sendable {}
