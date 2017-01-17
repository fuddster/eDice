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

    func countNum(_ num: Int) -> Int {
        var count = 0
        for d in dice {
            if (d.value == num) {
                count += 1
            }
        }
        
        return count
    }

    func score() -> Int {
        let n1 = countNum(1)
        let n2 = countNum(2)
        let n3 = countNum(3)
        let n4 = countNum(4)
        let n5 = countNum(5)
        let n6 = countNum(6)
        
        var score = 0

        if ((n1 == 1) &&
            (n2 == 1) &&
            (n3 == 1) &&
            (n4 == 1) &&
            (n5 == 1) &&
            (n6 == 1)) {
                return 1500
        }

        if (n1 > 2) {
            score += 1000 * (n1 - 2)
        } else {
            score += 100 * n1
        }
        
        if (n2 > 2) {
            score += 200 * (n2 - 2)
        }
        
        if (n3 > 2) {
            score += 300 * (n3 - 2)
        }
        
        if (n4 > 2) {
            score += 400 * (n4 - 2)
        }
        
        if (n5 > 2) {
            score += 500 * (n5 - 2)
        } else {
            score += 50 * n5
        }
        
        if (n6 > 2) {
            score += 600 * (n6 - 2)
        }

        return score
    }

}
