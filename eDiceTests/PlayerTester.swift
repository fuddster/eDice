//
//  PlayerTester.swift
//  eDice
//
//  Created by Scott Elmer on 5/6/17.
//  Copyright © 2017 Ozmium Enterprises. All rights reserved.
//

import XCTest

@testable import eDice

class PlayerTester: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNoParameters() {
        let p = Player()

        XCTAssertEqual(p.type, "human")
        XCTAssertEqual(p.roundScores.isEmpty, true)
        XCTAssertEqual(p.turnScores.isEmpty, true)
        XCTAssertEqual(p.skill, "low")
        XCTAssertEqual(p.name, "")
    }

    func testWithName() {
        let p = Player(withName: "Fudd")

        XCTAssertEqual(p.type, "human")
        XCTAssertEqual(p.roundScores.isEmpty, true)
        XCTAssertEqual(p.turnScores.isEmpty, true)
        XCTAssertEqual(p.skill, "low")
        XCTAssertEqual(p.name, "Fudd")
    }

    func testWithTypeSkill() {
        let p = Player(withType: "computer", withSkill: "low")

        XCTAssertEqual(p.type, "computer")
        XCTAssertEqual(p.roundScores.isEmpty, true)
        XCTAssertEqual(p.turnScores.isEmpty, true)
        XCTAssertEqual(p.skill, "low")
        XCTAssertEqual(p.name, "Computer")
    }

    func testSetName() {
        let p = Player()

        XCTAssertEqual(p.type, "human")
        XCTAssertEqual(p.roundScores.isEmpty, true)
        XCTAssertEqual(p.turnScores.isEmpty, true)
        XCTAssertEqual(p.skill, "low")
        XCTAssertEqual(p.name, "")

        p.setName(withName: "Fudd")
        XCTAssertEqual(p.name, "Fudd")
    }

    func testSetSkill() {
        let p = Player()

        XCTAssertEqual(p.type, "human")
        XCTAssertEqual(p.roundScores.isEmpty, true)
        XCTAssertEqual(p.turnScores.isEmpty, true)
        XCTAssertEqual(p.skill, "low")
        XCTAssertEqual(p.name, "")

        p.setSkill(withSkill: "medium")
        XCTAssertEqual(p.skill, "medium")
    }

    func testAddToRoundScore() {
        let p = Player()

        XCTAssertEqual(p.roundScores.isEmpty, true)
        p.addToRoundScores(100)
        XCTAssertEqual(p.roundScores[0], 100)
        p.addToRoundScores(5)
        XCTAssertEqual(p.roundScores[1], 5)
    }

    func testResetRoundScore() {
        let p = Player()

        XCTAssertEqual(p.roundScores.isEmpty, true)
        p.addToRoundScores(20)
        XCTAssertEqual(p.roundScores[0], 20)
        p.resetRoundScores()
        XCTAssertEqual(p.roundScores.isEmpty, true)
    }

    func testAddToTurnScore() {
        let p = Player()

        XCTAssertEqual(p.turnScores.isEmpty, true)
        p.addToTurnScores(100)
        XCTAssertEqual(p.turnScores[0], 100)
        p.addToTurnScores(5)
        XCTAssertEqual(p.turnScores[1], 5)
    }

    func testResetTurnScore() {
        let p = Player()

        XCTAssertEqual(p.turnScores.isEmpty, true)
        p.addToTurnScores(20)
        XCTAssertEqual(p.turnScores[0], 20)
        p.resetTurnScores()
        XCTAssertEqual(p.turnScores.isEmpty, true)
    }

    func testWithSkill() {
        let p = Player(withType: "computer", withSkill: "high")

        XCTAssertEqual(p.skill, "high")
        XCTAssertEqual(p.type, "computer")
        XCTAssertEqual(p.roundScores.isEmpty, true)
        XCTAssertEqual(p.turnScores.isEmpty, true)
        XCTAssertEqual(p.name, "Computer")
    }
}
