//
//  Player.swift
//  eDice
//
//  Created by Scott Elmer on 5/4/17.
//  Copyright © 2017 Ozmium Enterprises. All rights reserved.
//

import Foundation

class Player: NSObject {
    var type = "human"
    var turnScores = [Int]()
    var roundScores = [Int]()
    var name = ""
    var skill = "low"

    override init() {
    }

    init(withName name: String) {
        self.name = name
    }

    init(withType type: String) {
        self.type = type
        self.name = "Bob"
    }

    init(withType type: String, withSkill skill: String) {
        self.type = type
        self.skill = skill
        self.name = "Bob"
    }

    func setName(withName name: String) {
        self.name = name
    }

    func getName() -> String {
        return name
    }

    func setSkill(withSkill skill: String) {
        self.skill = skill
    }

    func getSkill() -> String {
        return skill
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
