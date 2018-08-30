//
//  Player.swift
//  eDice
//
//  Created by Scott Elmer on 5/4/17.
//  Copyright © 2017 Ozmium Enterprises. All rights reserved.
//

import Foundation

class Player: NSObject {
    var type = "Human"
    var turnScores = [Int]()
    var roundScores = [Int]()
    var name = ""
    let validTypes = ["Beginner", "Average", "Expert"]

    override init() {
    }

    init(withName name: String) {
        self.name = name
    }

    init(withType type: String) {
        if validTypes.contains(type) {
            self.type = type
        } else {
            self.type = validTypes[0]
        }
    }

    func setName(withName name: String) {
        self.name = name
    }

    func getName() -> String {
        return name
    }

    func setType(withType type: String) {
        if validTypes.contains(type) {
            self.type = type
        } else {
            self.type = validTypes[0]
        }
    }

    func getType() -> String {
        return type
    }

    func isHuman() -> Bool {
        if type == "Human" {
            return true
        }

        return false
    }

    func addToTurnScores(_ num: Int) {
        self.turnScores += [num]
    }

    func resetTurnScores() {
        turnScores = []
    }

    func addToRoundScores(_ num: Int) {
        self.roundScores += [num]
    }

    func resetRoundScores() {
        roundScores = []
    }

    func totalTurnScore() -> Int {
        var total = 0

        for tScore in turnScores {
            total += tScore
        }

        return total
    }

    func totalRoundScore() -> Int {
        var total = 0

        for rScore in roundScores {
            total += rScore
        }

        return total
    }
}
