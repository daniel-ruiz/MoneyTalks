
import Foundation

typealias Rate = Int
typealias RateDictionary = [String: Rate]

enum BrokerErrors: Error {
    case unknownRate
}

struct Broker {
    
    var rates: RateDictionary
    
    init() {
        rates = [:]
    }
    
    mutating func addRate(from: Currency, to: Currency, rate: Rate) {
        rates[keyForRate(from: from, to: to)] = rate
    }
    
    func rate(from: Currency, to: Currency) throws -> Rate {
        guard let rate = rates[keyForRate(from: from, to: to)] else {
            throw BrokerErrors.unknownRate
        }
        
        return rate
    }
    
    fileprivate func keyForRate(from: Currency, to: Currency) -> String {
        return "\(from)->\(to)"
    }
}
