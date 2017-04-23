
import XCTest
@testable import MoneyTalks

class WadTests: XCTestCase {
    
    func testCanCreateWad() {
        XCTAssertNotNil(Wad())
    }
    
    func testEquality() {
        let emptyWad: Wad = Wad()
        let singleBillWad = Wad(amount: 42, currency: "USD")
        
        // Identity
        XCTAssertEqual(emptyWad, emptyWad)
        XCTAssertEqual(singleBillWad, singleBillWad)
        
        XCTAssertNotEqual(emptyWad, singleBillWad)
        
        // Equivalence
        let tenEuros = Wad(amount: 10, currency: "EUR")
        let tenDollars = Wad(amount: 10, currency: "USD")
        let fifty1 = Wad(amount: 50, currency: "USD")
        let fifty2 = Wad(amount: 10, currency: "EUR")
            .plus(tenEuros).plus(tenDollars).plus(tenDollars).plus(tenEuros)
        let fifty3 = Wad(amount: 30, currency: "EUR")
            .plus(tenEuros).plus(tenDollars)
        
        XCTAssertEqual(fifty1, fifty2)
        XCTAssertEqual(fifty1, fifty3)
        XCTAssertEqual(fifty2, fifty3)
        
    }
    
    func testSimpleReduction() {
        let tenWad = Wad(amount: 10, currency: "EUR")
        let tenBill = Bill(amount: 10, currency: "EUR")
        XCTAssertEqual(try! tenWad.reduced(to: "EUR", broker: UnityBroker()), tenBill)
    }
    
}
