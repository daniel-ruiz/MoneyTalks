
import XCTest
@testable import MoneyTalks

class EuroTests: XCTestCase {
    
    var five: Euro!
    var otherFive: Euro!
    var ten: Euro!
    
    override func setUp() {
        super.setUp()
        
        five = Euro(5)
        otherFive = Euro(5)
        ten = Euro(10)
    }
    
    func testCanCreateEuro() {
        XCTAssertNotNil(Euro())
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
    
}
