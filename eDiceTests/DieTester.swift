//
//  DieTester.swift
//  eDice
//
//  Created by Scott Elmer on 12/31/16.
//  Copyright © 2016 Ozmium Enterprises. All rights reserved.
//

import UIKit
import XCTest

@testable import eDice

class DieTester: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testInitWithoutValue() {
        let die = Die()

        XCTAssertEqual(1, die.value)
        XCTAssertEqual(false, die.frozen)
        XCTAssertEqual(false, die.selected)
    }

    func testInitWithValue() {
        let die1 = Die(value: 1)
        let die2 = Die(value: 2)
        let die3 = Die(value: 3)
        let die4 = Die(value: 4)
        let die5 = Die(value: 5)
        let die6 = Die(value: 6)

        // Good values
        XCTAssertEqual(1, die1.value)
        XCTAssertEqual(2, die2.value)
        XCTAssertEqual(3, die3.value)
        XCTAssertEqual(4, die4.value)
        XCTAssertEqual(5, die5.value)
        XCTAssertEqual(6, die6.value)
    }

    func testInitOutOfRange() {
        let neg = Die(value: -1)
        let zero = Die(value: 0)
        let eight = Die(value: 8)
        let hundred = Die(value: 100)
        let wayneg = Die(value: -9999)

        XCTAssertEqual(1, neg.value)
        XCTAssertEqual(1, zero.value)
        XCTAssertEqual(1, eight.value)
        XCTAssertEqual(1, hundred.value)
        XCTAssertEqual(1, wayneg.value)
    }

    func testRollDie() {
        let die = Die()
        die.roll()

        XCTAssertTrue(die.value < 7, "Die value greater than 6")
        XCTAssertTrue(die.value > 0, "Die value less than 1")
    }

    func testRandomInRange() {
        let die = Die()

        // roll 1000 times testing output
        for _ in [0...1000] {
            die.roll()
            XCTAssertTrue(die.value < 7, "Die value greater than 6")
            XCTAssertTrue(die.value > 0, "Die value less than 1")
        }
    }

    func testNormalDieAssetNamesNotNil() {
        // test that assets are not nil
        XCTAssertNotNil(Die.normalDieAssets[1], "Asset name for die 1 is nil")
        XCTAssertNotNil(Die.normalDieAssets[2], "Asset name for die 2 is nil")
        XCTAssertNotNil(Die.normalDieAssets[3], "Asset name for die 3 is nil")
        XCTAssertNotNil(Die.normalDieAssets[4], "Asset name for die 4 is nil")
        XCTAssertNotNil(Die.normalDieAssets[5], "Asset name for die 5 is nil")
        XCTAssertNotNil(Die.normalDieAssets[6], "Asset name for die 6 is nil")
    }

    func testNormalDieAssetNameZeroIsNil() {
        // test that dieAsset[0] IS nil
        XCTAssertNil(Die.normalDieAssets[0], "Asset[0] should be nil.")
    }

    func testNormalDieAssetsExist() {
        // test assets exist in project
        XCTAssertNotNil(UIImage(named: Die.normalDieAssets[1]!), "Asset for die 1 is nil")
        XCTAssertNotNil(UIImage(named: Die.normalDieAssets[2]!), "Asset for die 2 is nil")
        XCTAssertNotNil(UIImage(named: Die.normalDieAssets[3]!), "Asset for die 3 is nil")
        XCTAssertNotNil(UIImage(named: Die.normalDieAssets[4]!), "Asset for die 4 is nil")
        XCTAssertNotNil(UIImage(named: Die.normalDieAssets[5]!), "Asset for die 5 is nil")
        XCTAssertNotNil(UIImage(named: Die.normalDieAssets[6]!), "Asset for die 6 is nil")
    }

    func testSelectedDieAssetNamesNotNil() {
        // test that assets are not nil
        XCTAssertNotNil(Die.selectedDieAssets[1], "Asset name for die 1 is nil")
        XCTAssertNotNil(Die.selectedDieAssets[2], "Asset name for die 2 is nil")
        XCTAssertNotNil(Die.selectedDieAssets[3], "Asset name for die 3 is nil")
        XCTAssertNotNil(Die.selectedDieAssets[4], "Asset name for die 4 is nil")
        XCTAssertNotNil(Die.selectedDieAssets[5], "Asset name for die 5 is nil")
        XCTAssertNotNil(Die.selectedDieAssets[6], "Asset name for die 6 is nil")
    }

    func testSelectedDieAssetNameZeroIsNil() {
        // test that dieAsset[0] IS nil
        XCTAssertNil(Die.selectedDieAssets[0], "Asset[0] should be nil.")
    }

    func testSelectedDieAssetsExist() {
        // test assets exist in project
        XCTAssertNotNil(UIImage(named: Die.selectedDieAssets[1]!), "Asset for die 1 is nil")
        XCTAssertNotNil(UIImage(named: Die.selectedDieAssets[2]!), "Asset for die 2 is nil")
        XCTAssertNotNil(UIImage(named: Die.selectedDieAssets[3]!), "Asset for die 3 is nil")
        XCTAssertNotNil(UIImage(named: Die.selectedDieAssets[4]!), "Asset for die 4 is nil")
        XCTAssertNotNil(UIImage(named: Die.selectedDieAssets[5]!), "Asset for die 5 is nil")
        XCTAssertNotNil(UIImage(named: Die.selectedDieAssets[6]!), "Asset for die 6 is nil")
    }

    func testFreezeVar() {
        let die = Die()
        let oldValue = die.value
        die.frozen = true
        die.roll()

        // Value should not change if the die is frozen
        XCTAssertEqual(oldValue, die.value)
        die.roll()
        XCTAssertEqual(oldValue, die.value)
        die.roll()
        XCTAssertEqual(oldValue, die.value)
    }

    func testFreezeFunc() {
        let die = Die()
        let oldValue = die.value
        die.freeze()
        XCTAssertEqual(die.frozen, true)
        die.roll()

        // Value should not change if the die is frozen
        XCTAssertEqual(oldValue, die.value)
        die.roll()
        XCTAssertEqual(oldValue, die.value)
        die.roll()
        XCTAssertEqual(oldValue, die.value)
    }

    func testUnFreezeFunc() {
        let die = Die()
        let oldValue = die.value
        die.frozen = true
        die.unfreeze()
        XCTAssertEqual(die.frozen, false)
        die.roll()

        // Value should change if the die is unfrozen
        XCTAssertNotEqual(oldValue, die.value)
        die.roll()
        XCTAssertNotEqual(oldValue, die.value)
        die.roll()
        XCTAssertNotEqual(oldValue, die.value)
    }

    func testToggleFreezeFunc() {
        let die = Die()
        XCTAssertEqual(die.frozen, false)
        die.toggleFrozen()
        XCTAssertEqual(die.frozen, true)
        die.toggleFrozen()
        XCTAssertEqual(die.frozen, false)
    }

    func testSelect() {
        let die = Die()
        XCTAssertEqual(die.selected, false)
        die.select()
        XCTAssertEqual(die.selected, true)
        die.select()
        XCTAssertEqual(die.selected, true)
    }

    func testToggleSelected() {
        let die = Die()
        XCTAssertEqual(die.selected, false)
        die.toggleSelected()
        XCTAssertEqual(die.selected, true)
        die.toggleSelected()
        XCTAssertEqual(die.selected, false)
    }
}
