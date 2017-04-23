
import XCTest
@testable import MoneyTalks

class MoneyTests: XCTestCase {
    
    var five: Money!
    var otherFive: Money!
    var ten: Money!
    var broker: Broker!
    
    override func setUp() {
        super.setUp()
        
        five = Money(amount: 5)
        otherFive = Money(amount: 5)
        ten = Money(amount: 10)
        broker = Broker()
    }
    
    func testCanCreateEuro() {
        XCTAssertNotNil(Money())
    }
    
    func testSimpleMultiplication(){
        let ten = five.times(2)
        XCTAssertEqual(ten._amount, 10)
    }
    
    func testEquality() {
        XCTAssertEqual(otherFive, otherFive)
        XCTAssertEqual(five, otherFive)
        XCTAssertNotEqual(five, ten)
    }
    
    func testThatObjectWithEqualHashAreEqual() {
        XCTAssertEqual(five.hashValue, otherFive.hashValue)
        XCTAssertNotEqual(ten.hashValue, otherFive.hashValue)
    }
    
    func testSimpleAddition() {
        XCTAssertEqual(ten, five.plus(otherFive))
    }
    
    func testSimpleReduction() {
        broker.addRate(from: "EUR", to: "EUR", rate: 1)
        XCTAssertEqual(try! five.reduced(to: "EUR", broker: broker), five)
    }
}
