//
//  Turn.swift
//  eDice
//
//  Created by Scott Elmer on 1/28/17.
//  Copyright © 2017 Ozmium Enterprises. All rights reserved.
//

import Foundation

class Turn {

    // Create an array of dice sets
    // For each roll where they save a die, add that dice set to the array
    //  OR
    // Just save off the score and add to a Turn score
    //  OR 
    // Create array of 6 dice set OR
    // For each roll add saved dice to array
    // Once all dice are used clear out array and start over
    // Need to have a running total of turn score
    //  OR
    // Create six variables for 6 dice sets
    // Tie each set to display on screen
    // For eachroll add saved dice to array
    // Once all dice are used clear out array and start over
    // Need to have a running total of turn score
    // 
    // Do you want to display the dice that have been roll and saved?

    var turnScore: Int
    var rollScore: Int

    init() {
        turnScore = 0
        rollScore = 0
    }

}
