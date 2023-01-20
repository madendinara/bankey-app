//
//  CurrencyFormatterTest.swift
//  bankey-appUnitTests
//
//  Created by Динара Зиманова on 1/20/23.
//

import Foundation
import XCTest

@testable import bankey_app

class CurrencyFormatterTest: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929281.45)
        XCTAssertEqual(result.0, "929,281")
        XCTAssertEqual(result.1, "45")
    }
    
    func testDollarFormatted() throws {
        let result = formatter.dollarsFormatted(929466)
        XCTAssertEqual(result, "$929,466.00")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result, "$0.00")
    }
}
