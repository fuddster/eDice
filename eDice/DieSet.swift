//
//  DieSet.swift
//  eDice
//
//  Created by Scott Elmer on 1/1/17.
//  Copyright © 2017 Ozmium Enterprises. All rights reserved.
//

import Foundation

class DieSet {
    var dice = [Die]()

    init() {
        dice.append(Die(value: 1)) // Die 1
        dice.append(Die(value: 2)) // Die 2
        dice.append(Die(value: 3)) // Die 3
        dice.append(Die(value: 4)) // Die 4
        dice.append(Die(value: 5)) // Die 5
        dice.append(Die(value: 6)) // Die 6
    }

    init(withNumOfDie numOfDie: Int) {
        var count = 0
        while count < numOfDie {
            dice.append(Die())
            count += 1
        }
    }

    init(fromArr arr: [Int] ) {
        for num in arr {
            dice.append(Die(value: num))
        }
    }

    func rollAll() {
        for die in dice {
            die.roll()
        }
    }

    func moveSelectedToFrozen() {
        for die in dice where die.selected {
            die.freeze()
            die.selected = false
        }
    }

    func countNum(_ num: Int, _ countSelected: Bool) -> Int {
        var count = 0

        for die in dice where die.value == num {
            if (countSelected) && (die.selected == true) {
                count += 1
            }
            if (!countSelected) && (die.selected == false) && (die.frozen == false) {
                count += 1
            }
        }
        //print("\(num): \(count)")
        return count
    }

    func setScoring(_ num: Int = 1) {
        for die in dice where die.value == num {
            die.scoring = true
        }
    }

    func score(_ countSelected: Bool = true) -> Int {
        let num1 = countNum(1, countSelected)
        let num2 = countNum(2, countSelected)
        let num3 = countNum(3, countSelected)
        let num4 = countNum(4, countSelected)
        let num5 = countNum(5, countSelected)
        let num6 = countNum(6, countSelected)

        var score = 0

        for die in dice {
            die.scoring = false
        }

        if (num1 == 1) && (num2 == 1) && (num3 == 1) &&
           (num4 == 1) && (num5 == 1) && (num6 == 1) {
                for die in dice {
                    die.scoring = true
                }
                return 1500
        }

        setScoring(1)
        setScoring(5)

        if num1 > 2 {
            score += 1000 * (num1 - 2)
        } else {
            score += 100 * num1
        }

        if num2 > 2 {
            setScoring(2)
            score += 200 * (num2 - 2)
        }

        if num3 > 2 {
            setScoring(3)
            score += 300 * (num3 - 2)
        }

        if num4 > 2 {
            setScoring(4)
            score += 400 * (num4 - 2)
        }

        if num5 > 2 {
            score += 500 * (num5 - 2)
        } else {
            score += 50 * num5
        }

        if num6 > 2 {
            setScoring(6)
            score += 600 * (num6 - 2)
        }

        return score
    }

    func freezeAll() {
        for die in dice {
            die.frozen = true
        }
    }

    func unFreezeAll() {
        for die in dice {
            die.frozen = false
        }
    }

    func allFrozen() -> Bool {
        var allFrozen: Bool = true
        for die in dice where !die.frozen {
            allFrozen = false
        }
        return allFrozen
    }

    func unSelectAll() {
        for die in dice {
            die.selected = false
        }
    }

    func allSelected() -> Bool {
        var allSelected: Bool = false
        for die in dice where !die.selected {
            allSelected = false
        }
        return allSelected
    }

    func countSelected() -> Int {
        var numSelected = 0
        for die in dice where die.selected {
            numSelected += 1
        }
        return numSelected
    }

    func nonScoringDiceSelected() -> Bool {
        var nonScoringDice = false
        for die in dice {
            if (die.selected) && (!die.scoring) {
                nonScoringDice = true
            }
        }
        return nonScoringDice
    }

    func logDice() -> String {
        var str = "Dice:"
        for die in dice {
            str += " "
            str += String(die.value)
        }

        return str
    }
}
