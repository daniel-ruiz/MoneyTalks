
import XCTest
@testable import MoneyTalks

class EuroTests: XCTestCase {
    
    func testCanCreateEuro() {
        XCTAssertNotNil(Euro())
    }
    
}
