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
    
    func testRollDie() {
        let d = Die()
        d.roll()
        
        XCTAssertTrue(d.value < 7, "Die value greater than 6")
        XCTAssertTrue(d.value > 0, "Die value less than 1")
    }

    func testRandomInRange() {
        let d = Die()
        
        // roll 1000 times testing output
        for _ in [0...1000] {
            d.roll()
            XCTAssertTrue(d.value < 7, "Die value greater than 6")
            XCTAssertTrue(d.value > 0, "Die value less than 1")
        }
    }

    func testDieAssetNamesNotNil() {
        let d = Die()
        
        // test that assets are not nil
        XCTAssertNotNil(d.dieAssets[1], "Asset name for die 1 is nil")
        XCTAssertNotNil(d.dieAssets[2], "Asset name for die 2 is nil")
        XCTAssertNotNil(d.dieAssets[3], "Asset name for die 3 is nil")
        XCTAssertNotNil(d.dieAssets[4], "Asset name for die 4 is nil")
        XCTAssertNotNil(d.dieAssets[5], "Asset name for die 5 is nil")
        XCTAssertNotNil(d.dieAssets[6], "Asset name for die 6 is nil")
    }
    
    func testDieAssetNameZeroIsNil() {
        let d = Die()
        
        // test that dieAsset[0] IS nil
        XCTAssertNil(d.dieAssets[0], "Asset[0] should be nil.")
    }

    func testDieAssetsExist() {
        let d = Die()
        
        // test assets exist in project
        XCTAssertNotNil(UIImage(named:d.dieAssets[1]!), "Asset for die 1 is nil")
        XCTAssertNotNil(UIImage(named:d.dieAssets[2]!), "Asset for die 2 is nil")
        XCTAssertNotNil(UIImage(named:d.dieAssets[3]!), "Asset for die 3 is nil")
        XCTAssertNotNil(UIImage(named:d.dieAssets[4]!), "Asset for die 4 is nil")
        XCTAssertNotNil(UIImage(named:d.dieAssets[5]!), "Asset for die 5 is nil")
        XCTAssertNotNil(UIImage(named:d.dieAssets[6]!), "Asset for die 6 is nil")
    }
}
