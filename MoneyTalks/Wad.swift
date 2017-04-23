
import Foundation

struct Wad {
    
    var _bills: [Bill] = []
    
}

extension Wad: Money {
    
    init(amount: Int = 0, currency: Currency = "EUR") {
        _bills.append(Bill(amount: amount, currency: currency))
    }
    
    func times(_ factor: Int) -> Wad {
        return self
    }
    
    func plus(_ addend: Wad) -> Wad {
        return Wad(_bills: _bills + addend._bills)
    }
    
    func reduced(to: Currency, broker: Rater) throws -> Bill {
        let translatedBills: [Bill] = try _bills.map{ (bill) throws -> Bill in
            try bill.reduced(to: to, broker: broker)
        }
        
        return translatedBills.reduce(Bill(currency: to), { $0.plus($1) })
    }
    
}

extension Wad: Equatable {
    
    public static func ==(lhs: Wad, rhs: Wad) -> Bool {
        let broker = UnityBroker()
        let reducedLhs = try! lhs.reduced(to: "USD", broker: broker)
        let reducedRhs = try! rhs.reduced(to: "USD", broker: broker)
        
        return reducedLhs == reducedRhs
    }
    
}
