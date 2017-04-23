
import Foundation

protocol Money {
    
    var _amount: Int { get }
    
    init(amount: Int, currency: Currency)
    
    func times(_ factor: Int) -> Bill
    func plus(_ addend: Money) -> Bill
    func reduced(to: Currency, broker: Broker) throws -> Bill
    
}
