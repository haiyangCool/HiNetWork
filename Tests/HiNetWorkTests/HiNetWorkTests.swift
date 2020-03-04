import XCTest
@testable import HiNetWork

final class HiNetWorkTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HiNetWork().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
