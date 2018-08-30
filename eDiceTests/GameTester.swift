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
        let game = Game()

        XCTAssertEqual(0, game.players.count)
        XCTAssertEqual(10, game.numOfRounds)
        XCTAssertEqual(0, game.currentPlayerNum)
        XCTAssertEqual(1, game.currentRound)
        XCTAssertEqual(true, game.newTurn)
    }

    func testAddHumanPlayer() {
        let game = Game()
        XCTAssertEqual(0, game.players.count)
        game.addHumanPlayer()
        XCTAssertEqual(1, game.players.count)
    }

    func testAddHumanPlayerWithName() {
        let game = Game()
        XCTAssertEqual(0, game.players.count)
        game.addHumanPlayer(withName: "Fudd")
        XCTAssertEqual(1, game.players.count)
        XCTAssertEqual("Fudd", game.players[0].getName())
    }

    func testAddComputerPlayer() {
        let game = Game()
        XCTAssertEqual(0, game.players.count)
        game.addComputerPlayer()
        XCTAssertEqual(1, game.players.count)
        XCTAssertEqual("Beginner", game.players[0].type)
    }

    func testAddComputerPlayerWithType() {
        let game = Game()
        XCTAssertEqual(0, game.players.count)
        game.addComputerPlayer(withType: "Expert")
        XCTAssertEqual(1, game.players.count)
        XCTAssertEqual("Expert", game.players[0].type)
    }

    func testAddingMixedPlayers() {
        let game = Game()
        XCTAssertEqual(0, game.players.count)
        game.addHumanPlayer(withName: "Fudd")
        game.addComputerPlayer()
        game.addComputerPlayer(withType: "Expert")
        XCTAssertEqual(3, game.players.count)
        XCTAssertEqual("Human", game.players[0].type)
        XCTAssertEqual("Beginner", game.players[1].type)
        XCTAssertEqual("Expert", game.players[2].type)
    }

    func testGoNil() {
        let game = Game()
        XCTAssertEqual(0, game.currentPlayerNum)
        XCTAssertEqual(nil, game.currentPlayer)
        game.go()
        XCTAssertEqual(0, game.currentPlayerNum)
        XCTAssertEqual(nil, game.currentPlayer)
    }

    func testGo() {
        let game = Game()
        game.addHumanPlayer(withName: "Fudd")
        game.addComputerPlayer()
        game.addComputerPlayer(withType: "Expert")
        XCTAssertEqual(0, game.currentPlayerNum)
        XCTAssertEqual(nil, game.currentPlayer)
        game.go()
        XCTAssertEqual(1, game.currentPlayerNum)
        XCTAssertEqual(game.players[0], game.currentPlayer)
    }

    func testNextPlayerNil() {
        let game = Game()
        game.nextPlayer()
        XCTAssertEqual(0, game.players.count)
        XCTAssertEqual(nil, game.currentPlayer)
    }

    func testNextPlayer() {
        let game = Game()
        XCTAssertEqual(0, game.players.count)
        XCTAssertEqual(nil, game.currentPlayer)
        game.nextPlayer()
        XCTAssertEqual(nil, game.currentPlayer)
        game.addHumanPlayer(withName: "Fudd")
        game.addComputerPlayer()
        game.addComputerPlayer(withType: "Expert")
        XCTAssertEqual(nil, game.currentPlayer)
        XCTAssertEqual(0, game.currentPlayerNum)
        XCTAssertEqual(1, game.currentRound)
        game.go()
        XCTAssertEqual("Fudd", game.currentPlayer.getName())
        XCTAssertEqual(game.currentPlayer, game.players[0])
        XCTAssertEqual(1, game.currentPlayerNum)
        XCTAssertEqual(1, game.currentRound)
        game.nextPlayer()
        XCTAssertEqual("Beginner", game.currentPlayer.type)
        XCTAssertEqual(game.currentPlayer, game.players[1])
        XCTAssertEqual(2, game.currentPlayerNum)
        XCTAssertEqual(1, game.currentRound)
        game.nextPlayer()
        XCTAssertEqual("Expert", game.currentPlayer.type)
        XCTAssertEqual(game.currentPlayer, game.players[2])
        XCTAssertEqual(3, game.currentPlayerNum)
        XCTAssertEqual(1, game.currentRound)
        game.nextPlayer()
        XCTAssertEqual("Fudd", game.currentPlayer.getName())
        XCTAssertEqual(game.currentPlayer, game.players[0])
        XCTAssertEqual(1, game.currentPlayerNum)
        XCTAssertEqual(2, game.currentRound)
    }

    func testGetCurrentPlayerName() {
        let game = Game()
        XCTAssertEqual(0, game.players.count)
        XCTAssertEqual(nil, game.currentPlayer)
        XCTAssertEqual("0 - Player 0", game.getCurrentPlayerName())
        game.nextPlayer()
        XCTAssertEqual(nil, game.currentPlayer)
        XCTAssertEqual("0 - Player 0", game.getCurrentPlayerName())
        game.addHumanPlayer(withName: "Fudd")
        game.addComputerPlayer()
        game.addComputerPlayer(withType: "Expert")
        XCTAssertEqual(nil, game.currentPlayer)
        XCTAssertEqual(0, game.currentPlayerNum)
        XCTAssertEqual("0 - Player 0", game.getCurrentPlayerName())
        game.go()
        XCTAssertEqual("1 - Fudd", game.getCurrentPlayerName())
        game.nextPlayer()
        XCTAssertEqual("2 - Player 2", game.getCurrentPlayerName())
        game.nextPlayer()
        XCTAssertEqual("3 - Player 3", game.getCurrentPlayerName())
        game.nextPlayer()
        XCTAssertEqual("1 - Fudd", game.getCurrentPlayerName())
    }
}
