
import XCTest
@testable import MoneyTalks

class WadTests: XCTestCase {
    
    var singleBillWad: Wad!
    
    override func setUp() {
        super.setUp()
        
        singleBillWad = Wad(amount: 42, currency: "USD")
    }
    
    func testCanCreateWad() {
        XCTAssertNotNil(Wad())
    }
    
    func testEquality() {
        let emptyWad: Wad = Wad()
        
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
        let fifteenBill = Bill(amount: 15, currency: "EUR")
        
        let reducedWad = try! tenWad.reduced(to: "EUR", broker: UnityBroker())
        
        XCTAssertEqual(reducedWad, tenBill)
        XCTAssertNotEqual(reducedWad, fifteenBill)
    }
    
    func testSimpleAddition() {
        XCTAssertEqual(singleBillWad.plus(Wad(amount: 8, currency: "USD")), Wad(amount: 50, currency: "USD"))
    }
    
    func testSimpleMultiplication() {
        let eightyFour = singleBillWad.times(2)
        XCTAssertEqual(eightyFour, Wad(amount: 84, currency: "USD"))
    }
    
}
