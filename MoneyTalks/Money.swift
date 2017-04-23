
import Foundation

typealias Currency = String

struct Money {
    
    var currency: Currency
    var _amount: Int
    
    init(amount: Int = 0, currency: Currency = "EUR") {
        self.currency = currency
        self._amount = amount
    }
    
    func times(_ factor: Int) -> Money {
        return Money(amount: _amount * factor)
    }
    
    func plus(_ other: Money) -> Money {
        return Money(amount: _amount + other._amount)
    }
    
    func reduced(to: Currency, broker: Broker) throws -> Money {
        let conversionRate = try broker.rate(from: currency, to: to)
        return Money(amount: _amount * conversionRate, currency: to)
    }
}

extension Money: Equatable {
    
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs._amount == rhs._amount
    }

}

extension Money: Hashable {
    
    public var hashValue: Int {
        get {
            return _amount.hashValue
        }
    }
    
}
