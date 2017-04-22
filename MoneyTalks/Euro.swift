
import Foundation

struct Euro {
    
    var _amount: Int
    
    init(_ amount: Int = 0) {
        _amount = amount
    }
    
    func times(_ factor: Int) -> Euro {
        return Euro(_amount * factor)
    }
    
    func plus(_ otherEuro: Euro) -> Euro {
        return Euro(_amount + otherEuro._amount)
    }
}

extension Euro: Equatable {
    
    public static func ==(lhs: Euro, rhs: Euro) -> Bool {
        return lhs._amount == rhs._amount
    }

}

extension Euro: Hashable {
    
    public var hashValue: Int {
        get {
            return _amount.hashValue
        }
    }
    
}
