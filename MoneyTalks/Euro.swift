
import Foundation

struct Euro {
    
    var _amount: Int
    
    init(_ amount: Int = 0) {
        _amount = amount
    }
    
    func times(_ factor: Int) -> Euro {
        return Euro(_amount * factor)
    }
}
