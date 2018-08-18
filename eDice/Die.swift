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
    static let normalDieAssets = [nil, "red_1", "red_2", "red_3", "red_4", "red_5", "red_6"]
    static let selectedDieAssets = [nil, "grey_1", "grey_2", "grey_3", "grey_4", "grey_5", "grey_6"]
    var value: Int
    var frozen: Bool = false
    var selected: Bool = false
    var scoring: Bool = false
    var button: UIImageView

    init() {
        self.value = 1
        self.button = UIImageView()
    }

    init(value: Int) {
        if (value > 0) && (value < 7) {
            self.value = value
        } else {
            self.value = 1
        }
        self.button = UIImageView()
    }

    func roll() {
        if !frozen {
            value = Int(arc4random_uniform(6) + 1)
        }
    }

    func freeze() {
        frozen = true
    }

    func unfreeze() {
        frozen = false
    }

    func toggleFrozen() {
        if frozen {
            frozen = false
        } else {
            frozen = true
        }
    }

    func select() {
        selected = true
    }
    func toggleSelected() {
        if selected {
            selected = false
        } else {
            selected = true
        }
    }
}
