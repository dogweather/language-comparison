import XCTest
@testable import TextService

final class TextServiceTests: XCTestCase {
    
    func testConvertsASingleQuote() throws {
        XCTAssertEqual(
            addTypography(text: "dog's life"), "dog’s life"
        )
    }
    
    func testConvertsDoubleQuotes() throws {
        XCTAssertEqual(
            addTypography(text: "\"Hello\""), "“Hello”"
        )
    }
    
    func testCreatesSimpleFractions() throws {
        let plaintext = "on 1/2 of an egg"
        let expected =  "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"

        XCTAssertEqual(
            addHtmlTypography(text: plaintext), expected
        )
    }
    
}
