//
//  Die.swift
//  eDice
//
//  Created by Scott Elmer on 12/31/16.
//  Copyright © 2016 Ozmium Enterprises. All rights reserved.
//

//import Foundation
import UIKit

class Die {
    static let dieAssets = [nil, "die_1", "die_2", "die_3", "die_4", "die_5", "die_6"]
    var value : Int
    var frozen : Bool = false

    init() {
        self.value = 1
    }

    init(value: Int) {
        self.value = value
    }

    func roll() {
        if (!frozen) {
            value = Int(arc4random_uniform(6) + 1)
        }
    }
    
    func score() -> Int {
        return -1
    }
}
