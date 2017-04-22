
import XCTest
@testable import MoneyTalks

class EuroTests: XCTestCase {
    
    var five: Euro!
    
    override func setUp() {
        super.setUp()
        
        five = Euro(5)
    }
    
    func testCanCreateEuro() {
        XCTAssertNotNil(Euro())
    }
    
    func  testSimpleMultiplication(){
        let ten = five.times(2)
        XCTAssertEqual(ten._amount, 10)
    }
    
}
