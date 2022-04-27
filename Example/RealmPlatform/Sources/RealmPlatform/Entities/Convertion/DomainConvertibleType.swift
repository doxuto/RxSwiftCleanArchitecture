import Foundation

public protocol DomainConvertibleType {
    associatedtype DomainType

    func asDomain() -> DomainType
}
