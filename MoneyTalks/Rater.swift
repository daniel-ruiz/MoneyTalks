
import Foundation

typealias Rate = Int
typealias RateDictionary = [String: Rate]

protocol Rater {
    func rate(from: Currency, to: Currency) throws -> Rate
}

extension Rater {
    
    func rate(from: Currency, to: Currency) throws -> Rate {
        return 1
    }
    
}
