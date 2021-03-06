//
//  Game.swift
//  eDice
//
//  Created by Scott Elmer on 1/28/17.
//  Copyright © 2017 Ozmium Enterprises. All rights reserved.
//

import Foundation

class Game: NSObject {
    // Players
    var players = [Player]()
    let numOfRounds = 10
    var currentPlayer: Player!
    var currentPlayerNum = 0
    var currentRound = 1
    var newTurn = true
    var dieSet = DieSet()

    func numOfPlayers() -> Int {
        return players.count
    }

    func addHumanPlayer() {
        players.append(Player())
    }

    func addHumanPlayer(withName name: String) {
        players.append(Player(withName: name))
    }

    func addComputerPlayer() {
        players.append(Player(withType: "Beginner"))
    }

    func addComputerPlayer(withType type: String) {
        players.append(Player(withType: type))
    }

    func getCurrentPlayerName() -> String {
        var name = ""
        if (currentPlayer == nil) || (currentPlayer.name == "") {
            name = String(currentPlayerNum) + " - Player " + String(currentPlayerNum)
        } else {
            name = String(currentPlayerNum) + " - " + currentPlayer.name
        }
        return(name)
    }

    func nextPlayer() {
        if players.isEmpty {
            print("No players!")
            return
        }

        if currentPlayer == players.last {
            currentPlayer = players.first!
            currentPlayerNum = 1
            currentRound += 1
        } else {
            let idx = players.firstIndex(of: currentPlayer)
            currentPlayer = players[idx!+1]
            currentPlayerNum += 1
        }
        //print ("New player: ", currentPlayer.name)
    }

    func go() {
        if players.isEmpty {
            return
        }

        currentRound = 1
        currentPlayer = players[0]
        currentPlayerNum = 1
    }
}
