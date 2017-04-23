
import Foundation

typealias Currency = String

protocol Money {
    
    init(amount: Int, currency: Currency)
    
    func times(_ factor: Int) -> Self
    func plus(_ addend: Self) -> Self
    func reduced(to: Currency, broker: Broker) throws -> Self
    
}
