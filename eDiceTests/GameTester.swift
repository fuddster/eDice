//
//  Game.swift
//  eDiceTests
//
//  Created by Scott Elmer on 8/7/18.
//  Copyright © 2018 Ozmium Enterprises. All rights reserved.
//

import XCTest

@testable import eDice

class GameTester: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNoParameters() {
        let g = Game()
        
        XCTAssertEqual(0, g.players.count)
        XCTAssertEqual(10, g.numOfRounds)
        XCTAssertEqual(0, g.currentPlayerNum)
        XCTAssertEqual(1, g.currentRound)
        XCTAssertEqual(true, g.newTurn)
    }

    func testAddHumanPlayer() {
        let g = Game()
        XCTAssertEqual(0, g.players.count)
        g.addHumanPlayer()
        XCTAssertEqual(1, g.players.count)
    }

    func testAddHumanPlayerWithName() {
        let g = Game()
        XCTAssertEqual(0, g.players.count)
        g.addHumanPlayer(withName: "Fudd")
        XCTAssertEqual(1, g.players.count)
        XCTAssertEqual("Fudd", g.players[0].getName())
    }

    func testAddComputerPlayer() {
        let g = Game()
        XCTAssertEqual(0, g.players.count)
        g.addComputerPlayer()
        XCTAssertEqual(1, g.players.count)
        XCTAssertEqual("computer", g.players[0].type)
    }

    func testAddComputerPlayerWithSkill() {
        let g = Game()
        XCTAssertEqual(0, g.players.count)
        g.addComputerPlayer(withSkill: "high")
        XCTAssertEqual(1, g.players.count)
        XCTAssertEqual("computer", g.players[0].type)
        XCTAssertEqual("high", g.players[0].getSkill())
    }

    func testAddingMixedPlayers() {
        let g = Game()
        XCTAssertEqual(0, g.players.count)
        g.addHumanPlayer(withName: "Fudd")
        g.addComputerPlayer()
        g.addComputerPlayer(withSkill: "high")
        XCTAssertEqual(3, g.players.count)
        XCTAssertEqual("human", g.players[0].type)
        XCTAssertEqual("computer", g.players[1].type)
        XCTAssertEqual("computer", g.players[2].type)
        XCTAssertEqual("high", g.players[2].getSkill())
    }

    func testGoNil() {
        let g = Game()
        XCTAssertEqual(0, g.currentPlayerNum)
        XCTAssertEqual(nil, g.currentPlayer)
        g.go()
        XCTAssertEqual(0, g.currentPlayerNum)
        XCTAssertEqual(nil, g.currentPlayer)
    }

    func testGo() {
        let g = Game()
        g.addHumanPlayer(withName: "Fudd")
        g.addComputerPlayer()
        g.addComputerPlayer(withSkill: "high")
        XCTAssertEqual(0, g.currentPlayerNum)
        XCTAssertEqual(nil, g.currentPlayer)
        g.go()
        XCTAssertEqual(1, g.currentPlayerNum)
        XCTAssertEqual(g.players[0], g.currentPlayer)
    }
    
    func testNextPlayerNil() {
        let g = Game()
        g.nextPlayer()
        XCTAssertEqual(0, g.players.count)
        XCTAssertEqual(nil, g.currentPlayer)
    }

    func testNextPlayer() {
        let g = Game()
        XCTAssertEqual(0, g.players.count)
        XCTAssertEqual(nil, g.currentPlayer)
        g.nextPlayer()
        XCTAssertEqual(nil, g.currentPlayer)
        g.addHumanPlayer(withName: "Fudd")
        g.addComputerPlayer()
        g.addComputerPlayer(withSkill: "high")
        XCTAssertEqual(nil, g.currentPlayer)
        XCTAssertEqual(0, g.currentPlayerNum)
        XCTAssertEqual(1, g.currentRound)
        g.go()
        XCTAssertEqual("Fudd", g.currentPlayer.getName())
        XCTAssertEqual(g.currentPlayer, g.players[0])
        XCTAssertEqual(1, g.currentPlayerNum)
        XCTAssertEqual(1, g.currentRound)
        g.nextPlayer()
        XCTAssertEqual("computer", g.currentPlayer.type)
        XCTAssertEqual(g.currentPlayer, g.players[1])
        XCTAssertEqual(2, g.currentPlayerNum)
        XCTAssertEqual(1, g.currentRound)
        g.nextPlayer()
        XCTAssertEqual("computer", g.currentPlayer.type)
        XCTAssertEqual("high", g.currentPlayer.getSkill())
        XCTAssertEqual(g.currentPlayer, g.players[2])
        XCTAssertEqual(3, g.currentPlayerNum)
        XCTAssertEqual(1, g.currentRound)
        g.nextPlayer()
        XCTAssertEqual("Fudd", g.currentPlayer.getName())
        XCTAssertEqual(g.currentPlayer, g.players[0])
        XCTAssertEqual(1, g.currentPlayerNum)
        XCTAssertEqual(2, g.currentRound)
    }

    func testGetCurrentPlayerName() {
        let g = Game()
        XCTAssertEqual(0, g.players.count)
        XCTAssertEqual(nil, g.currentPlayer)
        XCTAssertEqual("0 - Player 0", g.getCurrentPlayerName())
        g.nextPlayer()
        XCTAssertEqual(nil, g.currentPlayer)
        XCTAssertEqual("0 - Player 0", g.getCurrentPlayerName())
        g.addHumanPlayer(withName: "Fudd")
        g.addComputerPlayer()
        g.addComputerPlayer(withSkill: "high")
        XCTAssertEqual(nil, g.currentPlayer)
        XCTAssertEqual(0, g.currentPlayerNum)
        XCTAssertEqual("0 - Player 0", g.getCurrentPlayerName())
        g.go()
        XCTAssertEqual("1 - Fudd", g.getCurrentPlayerName())
        g.nextPlayer()
        XCTAssertEqual("2 - Bob", g.getCurrentPlayerName())
        g.nextPlayer()
        XCTAssertEqual("3 - Bob", g.getCurrentPlayerName())
        g.nextPlayer()
        XCTAssertEqual("1 - Fudd", g.getCurrentPlayerName())
    }
}
