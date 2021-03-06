//
//  DieSetTester.swift
//  eDice
//
//  Created by Scott Elmer on 1/1/17.
//  Copyright © 2017 Ozmium Enterprises. All rights reserved.
//

import XCTest

@testable import eDice

class DieSetTester: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testInitWithArr() {
        let ds1 = DieSet(fromArr: [1, 2, 3, 4, 5, 6])

        var count = 1
        for die in ds1.dice {
            XCTAssertEqual(count, die.value)
            count += 1
        }

        let ds2 = DieSet(fromArr: [1, 2, 3, 4, 5, 6, 6, 5, 4, 3, 2, 1, 1, 2, 3, 4, 5, 6])
        XCTAssertEqual(18, ds2.dice.count)
    }

    func testInitWithNumOfDie() {
        let ds1 = DieSet(withNumOfDie: 10)

        XCTAssertEqual(10, ds1.dice.count)

        let ds2 = DieSet(withNumOfDie: 199)
        XCTAssertEqual(199, ds2.dice.count)

        let ds3 = DieSet(withNumOfDie: 0)
        XCTAssertEqual(0, ds3.dice.count)

        let ds4 = DieSet(withNumOfDie: -99)
        XCTAssertEqual(0, ds4.dice.count)
    }

    func testInitWithOutParams() {
        let ds1 = DieSet()

        XCTAssertEqual(6, ds1.dice.count)
        var count = 1
        for die in ds1.dice {
            XCTAssertEqual(count, die.value)
            count += 1
        }
    }

    func testOnesScore() {
        let ds1 = DieSet(fromArr: [1, 2, 3, 4, 4, 6])
        XCTAssertEqual(100, ds1.score(false))

        let ds2 = DieSet(fromArr: [6, 4, 3, 2, 1, 1])
        XCTAssertEqual(200, ds2.score(false))

        let ds3 = DieSet(fromArr: [2, 1, 2, 3, 1, 4])
        XCTAssertEqual(200, ds3.score(false))
    }

    func testFivesScore() {
        let ds1 = DieSet(fromArr: [2, 2, 3, 4, 5, 6])
        XCTAssertEqual(50, ds1.score(false))

        let ds2 = DieSet(fromArr: [6, 4, 3, 2, 5, 5])
        XCTAssertEqual(100, ds2.score(false))

        let ds3 = DieSet(fromArr: [6, 5, 2, 2, 5, 6])
        XCTAssertEqual(100, ds3.score(false))
    }

    func testTripleScore() {
        let ds1 = DieSet(fromArr: [2, 3, 1, 1, 1, 2])
        XCTAssertEqual(1000, ds1.score(false))

        let ds2 = DieSet(fromArr: [3, 2, 2, 2, 4, 6])
        XCTAssertEqual(200, ds2.score(false))

        let ds3 = DieSet(fromArr: [3, 2, 3, 2, 3, 6])
        XCTAssertEqual(300, ds3.score(false))

        let ds4 = DieSet(fromArr: [2, 4, 2, 4, 6, 4])
        XCTAssertEqual(400, ds4.score(false))

        let ds5 = DieSet(fromArr: [6, 5, 6, 5, 5, 2])
        XCTAssertEqual(500, ds5.score(false))

        let ds6 = DieSet(fromArr: [2, 3, 4, 6, 6, 6])
        XCTAssertEqual(600, ds6.score(false))
    }

    func testQuadScore() {
        let ds1 = DieSet(fromArr: [1, 3, 1, 1, 1, 2])
        XCTAssertEqual(2000, ds1.score(false))

        let ds2 = DieSet(fromArr: [2, 2, 2, 2, 4, 6])
        XCTAssertEqual(400, ds2.score(false))

        let ds3 = DieSet(fromArr: [3, 3, 3, 2, 3, 6])
        XCTAssertEqual(600, ds3.score(false))

        let ds4 = DieSet(fromArr: [2, 4, 4, 4, 6, 4])
        XCTAssertEqual(800, ds4.score(false))

        let ds5 = DieSet(fromArr: [6, 5, 6, 5, 5, 5])
        XCTAssertEqual(1000, ds5.score(false))

        let ds6 = DieSet(fromArr: [2, 3, 6, 6, 6, 6])
        XCTAssertEqual(1200, ds6.score(false))
    }

    func testQintScore() {
        let ds1 = DieSet(fromArr: [1, 1, 1, 1, 1, 2])
        XCTAssertEqual(3000, ds1.score(false))

        let ds2 = DieSet(fromArr: [2, 2, 2, 2, 4, 2])
        XCTAssertEqual(600, ds2.score(false))

        let ds3 = DieSet(fromArr: [3, 3, 3, 2, 3, 3])
        XCTAssertEqual(900, ds3.score(false))

        let ds4 = DieSet(fromArr: [4, 4, 2, 4, 4, 4])
        XCTAssertEqual(1200, ds4.score(false))

        let ds5 = DieSet(fromArr: [5, 6, 5, 5, 5, 5])
        XCTAssertEqual(1500, ds5.score(false))

        let ds6 = DieSet(fromArr: [2, 6, 6, 6, 6, 6])
        XCTAssertEqual(1800, ds6.score(false))
    }

    func testSextScore() {
        let ds1 = DieSet(fromArr: [1, 1, 1, 1, 1, 1])
        XCTAssertEqual(4000, ds1.score(false))

        let ds2 = DieSet(fromArr: [2, 2, 2, 2, 2, 2])
        XCTAssertEqual(800, ds2.score(false))

        let ds3 = DieSet(fromArr: [3, 3, 3, 3, 3, 3])
        XCTAssertEqual(1200, ds3.score(false))

        let ds4 = DieSet(fromArr: [4, 4, 4, 4, 4, 4])
        XCTAssertEqual(1600, ds4.score(false))

        let ds5 = DieSet(fromArr: [5, 5, 5, 5, 5, 5])
        XCTAssertEqual(2000, ds5.score(false))

        let ds6 = DieSet(fromArr: [6, 6, 6, 6, 6, 6])
        XCTAssertEqual(2400, ds6.score(false))
    }

    func testStraightScore() {
        let ds1 = DieSet(fromArr: [1, 2, 3, 4, 5, 6])
        XCTAssertEqual(1500, ds1.score(false))
    }

    func testMixedScores() {
        let ds1 = DieSet(fromArr: [1, 2, 3, 3, 5, 6])
        XCTAssertEqual(150, ds1.score(false))

        let ds2 = DieSet(fromArr: [1, 2, 2, 2, 5, 6])
        XCTAssertEqual(350, ds2.score(false))

        let ds3 = DieSet(fromArr: [2, 3, 3, 3, 3, 5])
        XCTAssertEqual(650, ds3.score(false))

        let ds4 = DieSet(fromArr: [1, 1, 1, 5, 5, 5])
        XCTAssertEqual(1500, ds4.score(false))

        let ds5 = DieSet(fromArr: [4, 4, 4, 6, 6, 6])
        XCTAssertEqual(1000, ds5.score(false))
    }

    func testCountNum() {
        let ds1 = DieSet(fromArr: [1, 2, 3, 4, 5, 6])
        XCTAssertEqual(1, ds1.countNum(1, false))

        let ds2 = DieSet(fromArr: [1, 2, 2, 3, 4, 5])
        XCTAssertEqual(2, ds2.countNum(2, false))

        let ds3 = DieSet(fromArr: [1, 2, 3, 3, 3, 4])
        XCTAssertEqual(3, ds3.countNum(3, false))

        let ds4 = DieSet(fromArr: [4, 4, 4, 4, 5, 6])
        XCTAssertEqual(4, ds4.countNum(4, false))

        let ds5 = DieSet(fromArr: [4, 5, 5, 5, 5, 5])
        XCTAssertEqual(5, ds5.countNum(5, false))

        let ds6 = DieSet(fromArr: [6, 6, 6, 6, 6, 6])
        XCTAssertEqual(6, ds6.countNum(6, false))
    }

    func testFrozenCountNum() {
        // To Do - Test where countAll is false
    }
}
