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
        var i = 0;
        while (i < numOfDie) {
            dice.append(Die())
            i += 1
        }
    }

    init(fromArr arr: [Int] ) {
        for d in arr {
            dice.append(Die(value: d))
        }
    }

    func rollAll() {
        for d in dice {
            d.roll()
        }
    }

    func moveSelectedToFrozen() {
        for d in dice {
            if (d.selected) {
                d.freeze()
                d.selected = false
            }
        }
    }

    func countNum(_ num: Int, _ countSelected: Bool) -> Int {
        var count = 0

        for d in dice {
            if (d.value == num) {
                if ((countSelected) && (d.selected == true)) {
                    count += 1
                }
                if ((!countSelected) && (d.selected == false) && (d.frozen == false)) {
                    count += 1
                }
            }
        }
        //print("\(num): \(count)")
        return count
    }

    func setScoring(_ num: Int = 1) {
        for d in dice {
            if (d.value == num) {
                d.scoring = true
            }
        }
    }

    func score(_ countSelected: Bool = true) -> Int {
        let n1 = countNum(1, countSelected)
        let n2 = countNum(2, countSelected)
        let n3 = countNum(3, countSelected)
        let n4 = countNum(4, countSelected)
        let n5 = countNum(5, countSelected)
        let n6 = countNum(6, countSelected)

        var score = 0

        for d in dice {
            d.scoring = false
        }

        if ((n1 == 1) &&
            (n2 == 1) &&
            (n3 == 1) &&
            (n4 == 1) &&
            (n5 == 1) &&
            (n6 == 1)) {
                for d in dice {
                    d.scoring = true
                }
                return 1500
        }

        setScoring(1)
        setScoring(5)
        
        if (n1 > 2) {
            score += 1000 * (n1 - 2)
        } else {
            score += 100 * n1
        }

        if (n2 > 2) {
            setScoring(2)
            score += 200 * (n2 - 2)
        }

        if (n3 > 2) {
            setScoring(3)
            score += 300 * (n3 - 2)
        }

        if (n4 > 2) {
            setScoring(4)
            score += 400 * (n4 - 2)
        }

        if (n5 > 2) {
            score += 500 * (n5 - 2)
        } else {
            score += 50 * n5
        }

        if (n6 > 2) {
            setScoring(6)
            score += 600 * (n6 - 2)
        }

        return score
    }

    func freezeAll() {
        for d in dice {
            d.frozen = true
        }
    }

    func unFreezeAll() {
        for d in dice {
            d.frozen = false
        }
    }

    func allFrozen() -> Bool {
        var allFrozen: Bool = true
        for d in dice {
            if (!d.frozen) {
                allFrozen = false
            }
        }
        return allFrozen
    }

    func unSelectAll() {
        for d in dice {
            d.selected = false
        }
    }

    func allSelected() -> Bool {
        var allSelected: Bool = false
        for d in dice {
            if (!d.selected) {
                allSelected = false
            }
        }
        return allSelected
    }

    func countSelected() -> Int {
        var numSelected = 0
        for d in dice {
            if (d.selected) {
                numSelected += 1
            }
        }
        return numSelected
    }

    func nonScoringDiceSelected() -> Bool {
        var nonScoringDice = false
        for d in dice {
            if ((d.selected) && (!d.scoring)) {
                nonScoringDice = true
            }
        }
        return nonScoringDice
    }
}
