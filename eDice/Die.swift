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
    let dieAssets = [nil, "die_1", "die_2", "die_3", "die_4", "die_5", "die_6"]
    var value : Int
    var frozen : Bool = false
    
    init() {
        value = 1
        self.roll()
    }

    func roll() {
        if (!frozen) {
            value = Int(arc4random_uniform(6) + 1)
        }
    }
}
