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
    var ds = DieSet()

    func addHumanPlayer() {
        players.append(Player())
    }
    
    func addHumanPlayer(withName name:String) {
        players.append(Player(withName: name))
    }

    func addComputerPlayer() {
        players.append(Player(withType: "computer"))
    }
    
    func addComputerPlayer(withSkill skill:String) {
        players.append(Player(withType: "computer", withSkill: skill))
    }
    
    func getCurrentPlayerName() -> String {
        var name = ""
        if ((currentPlayer == nil) || (currentPlayer.name == "")) {
            name = String(currentPlayerNum) + " - Player " + String(currentPlayerNum)
        } else {
            name = String(currentPlayerNum) + " - " + currentPlayer.name
        }
        return(name)
    }

    func nextPlayer() {
        if (players.isEmpty) {
            print("No players!")
            return
        }

        if (currentPlayer == players.last) {
            currentPlayer = players.first!
            currentPlayerNum = 1
            currentRound += 1
        } else {
            let i = players.index(of: currentPlayer)
            currentPlayer = players[i!+1]
            currentPlayerNum += 1
        }
        print ("New player: ", currentPlayer.name)
    }

    func go() {
        if (players.isEmpty) {
            return
        }

        currentRound = 1
        currentPlayer = players[0]
        currentPlayerNum = 1
    }
}
