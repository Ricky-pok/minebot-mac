import XCTest
@testable import MacroMac

final class MacroMacTests: XCTestCase {
    func testProfileEncoding() throws {
        let profile = MacroProfile(
            name: "Test",
            actions: [.delay(milliseconds: 100)]
        )

        let data = try JSONEncoder().encode(profile)
        let decoded = try JSONDecoder().decode(MacroProfile.self, from: data)

        XCTAssertEqual(decoded.name, "Test")
        XCTAssertEqual(decoded.actions.count, 1)
    }
}
