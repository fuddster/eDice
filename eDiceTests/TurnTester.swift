//
//  TurnTester.swift
//  eDiceTests
//
//  Created by Scott Elmer on 7/21/19.
//  Copyright © 2019 Ozmium Enterprises. All rights reserved.
//

import XCTest

@testable import eDice

class TurnTester: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNoParameters() {
        let turn = Turn()

        XCTAssertEqual(0, turn.turnScore)
        XCTAssertEqual(0, turn.rollScore)
    }
}
