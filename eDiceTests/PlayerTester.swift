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
        let player = Player()

        XCTAssertEqual(player.type, "human")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.skill, "low")
        XCTAssertEqual(player.name, "")
    }

    func testWithName() {
        let player = Player(withName: "Fudd")

        XCTAssertEqual(player.type, "human")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.skill, "low")
        XCTAssertEqual(player.name, "Fudd")
    }

    func testWithType() {
        let player = Player(withType: "computer")

        XCTAssertEqual(player.type, "computer")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.skill, "low")
        XCTAssertEqual(player.name, "Bob")
    }

    func testWithTypeSkill() {
        let player = Player(withType: "computer", withSkill: "high")

        XCTAssertEqual(player.skill, "high")
        XCTAssertEqual(player.type, "computer")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "Bob")
    }

    func testSetName() {
        let player = Player()

        XCTAssertEqual(player.type, "human")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.skill, "low")
        XCTAssertEqual(player.name, "")

        player.setName(withName: "Fudd")
        XCTAssertEqual(player.name, "Fudd")
    }

    func testGetName() {
        let player = Player()

        XCTAssertEqual(player.getName(), "")
        player.setName(withName: "Fudd")
        XCTAssertEqual(player.getName(), "Fudd")
    }

    func testSetSkill() {
        let player = Player()

        XCTAssertEqual(player.type, "human")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.skill, "low")
        XCTAssertEqual(player.name, "")

        player.setSkill(withSkill: "medium")
        XCTAssertEqual(player.skill, "medium")
    }

    func testGetSkill() {
        let player = Player()

        XCTAssertEqual(player.getSkill(), "low")
        player.setSkill(withSkill: "high")
        XCTAssertEqual(player.getSkill(), "high")
    }

    func testAddToRoundScore() {
        let player = Player()

        XCTAssertEqual(player.roundScores.isEmpty, true)
        player.addToRoundScores(100)
        XCTAssertEqual(player.roundScores[0], 100)
        player.addToRoundScores(5)
        XCTAssertEqual(player.roundScores[1], 5)
    }

    func testResetRoundScore() {
        let player = Player()

        XCTAssertEqual(player.roundScores.isEmpty, true)
        player.addToRoundScores(20)
        XCTAssertEqual(player.roundScores[0], 20)
        player.resetRoundScores()
        XCTAssertEqual(player.roundScores.isEmpty, true)
    }

    func testAddToTurnScore() {
        let player = Player()

        XCTAssertEqual(player.turnScores.isEmpty, true)
        player.addToTurnScores(100)
        XCTAssertEqual(player.turnScores[0], 100)
        player.addToTurnScores(5)
        XCTAssertEqual(player.turnScores[1], 5)
    }

    func testResetTurnScore() {
        let player = Player()

        XCTAssertEqual(player.turnScores.isEmpty, true)
        player.addToTurnScores(20)
        XCTAssertEqual(player.turnScores[0], 20)
        player.resetTurnScores()
        XCTAssertEqual(player.turnScores.isEmpty, true)
    }

    func testTotalTurnScore() {
        let player = Player()

        XCTAssertEqual(player.totalTurnScore(), 0)
        player.addToTurnScores(100)
        XCTAssertEqual(player.turnScores[0], 100)
        player.addToTurnScores(5)
        XCTAssertEqual(player.turnScores[1], 5)
        XCTAssertEqual(player.totalTurnScore(), 105)
        player.resetTurnScores()
        XCTAssertEqual(player.totalTurnScore(), 0)
    }

    func testTotalRoundScore() {
        let player = Player()

        XCTAssertEqual(player.totalRoundScore(), 0)
        player.addToRoundScores(100)
        XCTAssertEqual(player.roundScores[0], 100)
        player.addToRoundScores(5)
        XCTAssertEqual(player.roundScores[1], 5)
        XCTAssertEqual(player.totalRoundScore(), 105)
        player.resetRoundScores()
        XCTAssertEqual(player.totalRoundScore(), 0)
    }

}
