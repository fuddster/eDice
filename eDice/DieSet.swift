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
        dice.append(Die()) // Die 1
        dice.append(Die()) // Die 2
        dice.append(Die()) // Die 3
        dice.append(Die()) // Die 4
        dice.append(Die()) // Die 5
        dice.append(Die()) // Die 6
    }

    init(withNumOfDie numOfDie: Int) {
        
    }

    init(fromArr arr: [Int] ) {
        for d in arr {
            dice.append(Die(value: d))
        }
    }

    func score() -> Int {
        return -1
    }

}
