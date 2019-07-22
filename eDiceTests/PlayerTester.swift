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

        XCTAssertEqual(player.type, "Human")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "")
    }

    func testWithName() {
        let player = Player(withName: "Fudd")

        XCTAssertEqual(player.type, "Human")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "Fudd")
    }

    func testWithType() {
        let player = Player(withType: "Beginner")

        XCTAssertEqual(player.type, "Beginner")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "")
    }

    func testWithTypeBeginner() {
        let player = Player(withType: "Beginner")

        XCTAssertEqual(player.type, "Beginner")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "")
    }

    func testWithTypeAverage() {
        let player = Player(withType: "Average")

        XCTAssertEqual(player.type, "Average")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "")
    }

    func testWithTypeExpert() {
        let player = Player(withType: "Expert")

        XCTAssertEqual(player.type, "Expert")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "")
    }

    func testWithTypeDefault() {
        let player = Player(withType: "garbage")

        XCTAssertEqual(player.type, "Beginner")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "")
    }

    func testSetName() {
        let player = Player()

        XCTAssertEqual(player.type, "Human")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
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

    func testSetType() {
        let player = Player()

        XCTAssertEqual(player.type, "Human")
        XCTAssertEqual(player.roundScores.isEmpty, true)
        XCTAssertEqual(player.turnScores.isEmpty, true)
        XCTAssertEqual(player.name, "")

        player.setType(withType: "Beginner")
        XCTAssertEqual(player.type, "Beginner")
        player.setType(withType: "Average")
        XCTAssertEqual(player.type, "Average")
        player.setType(withType: "Expert")
        XCTAssertEqual(player.type, "Expert")
        player.setType(withType: "XXXXX")
        XCTAssertEqual(player.type, player.validTypes[0])
    }

    func testGetType() {
        var player = Player()
        XCTAssertEqual("Human", player.getType())

        player = Player(withType: "Average")
        XCTAssertEqual("Average", player.getType())

        player = Player(withType: "Expert")
        XCTAssertEqual("Expert", player.getType())

        player = Player(withType: "garbage")
        XCTAssertEqual("Beginner", player.getType())

        player = Player(withName: "Fuudd")
        XCTAssertEqual("Human", player.getType())
    }

    func testIsHuman() {
        var player = Player()

        XCTAssertEqual(true, player.isHuman())
        player = Player(withName: "Fudd")
        XCTAssertEqual(true, player.isHuman())
        player = Player(withType: "Beginner")
        XCTAssertEqual(false, player.isHuman())
        player = Player(withType: "Average")
        XCTAssertEqual(false, player.isHuman())
        player = Player(withType: "Expert")
        XCTAssertEqual(false, player.isHuman())
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
