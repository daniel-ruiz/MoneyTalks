
import XCTest
@testable import MoneyTalks

class BrokerTests: XCTestCase {
    
    func testCanCreateBroker() {
        XCTAssertNotNil(Broker())
    }
    
    func testCanAddAndGetRates() {
        let expectedRate = 2
        var broker = Broker()
        broker.addRate(from: "EUR", to: "USD", rate: expectedRate)
        let actualRate = try! broker.rate(from: "EUR", to: "USD")
        
        XCTAssertEqual(actualRate, expectedRate)
    }
    
    func testThrowErrorWhenRateNotFound() {
        let broker = Broker()
        XCTAssertThrowsError(try broker.rate(from: "EUR", to: "EUR"))
    }
    
}
