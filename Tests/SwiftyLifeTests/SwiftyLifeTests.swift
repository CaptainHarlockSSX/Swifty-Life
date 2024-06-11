// Test not written. WiP.

import XCTest
@testable import SwiftyLife

final class SwiftyLifeTests: XCTestCase {
    func testModelInit() throws {
        let lifeModel = LifeModel(width: 1980, height: 720, livingCellsAmount: 70)
    }
}
