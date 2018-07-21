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

    func testWithType() {
        let p = Player(withType: "computer")
        
        XCTAssertEqual(p.type, "computer")
        XCTAssertEqual(p.roundScores.isEmpty, true)
        XCTAssertEqual(p.turnScores.isEmpty, true)
        XCTAssertEqual(p.skill, "low")
        XCTAssertEqual(p.name, "Bob")
    }
    
    func testWithTypeSkill() {
        let p = Player(withType: "computer", withSkill: "high")
        
        XCTAssertEqual(p.skill, "high")
        XCTAssertEqual(p.type, "computer")
        XCTAssertEqual(p.roundScores.isEmpty, true)
        XCTAssertEqual(p.turnScores.isEmpty, true)
        XCTAssertEqual(p.name, "Bob")
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

    func testGetName() {
        let p = Player()

        XCTAssertEqual(p.getName(), "")
        p.setName(withName: "Fudd")
        XCTAssertEqual(p.getName(), "Fudd")
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

    func testGetSkill() {
        let p = Player()

        XCTAssertEqual(p.getSkill(), "low")
        p.setSkill(withSkill: "high")
        XCTAssertEqual(p.getSkill(), "high")
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

    func testTotalTurnScore() {
        let p = Player()

        XCTAssertEqual(p.totalTurnScore(), 0)
        p.addToTurnScores(100)
        XCTAssertEqual(p.turnScores[0], 100)
        p.addToTurnScores(5)
        XCTAssertEqual(p.turnScores[1], 5)
        XCTAssertEqual(p.totalTurnScore(), 105)
        p.resetTurnScores()
        XCTAssertEqual(p.totalTurnScore(), 0)
    }

    func testTotalRoundScore() {
        let p = Player()
        
        XCTAssertEqual(p.totalRoundScore(), 0)
        p.addToRoundScores(100)
        XCTAssertEqual(p.roundScores[0], 100)
        p.addToRoundScores(5)
        XCTAssertEqual(p.roundScores[1], 5)
        XCTAssertEqual(p.totalRoundScore(), 105)
        p.resetRoundScores()
        XCTAssertEqual(p.totalRoundScore(), 0)
    }
    
}
