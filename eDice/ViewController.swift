//
//  ViewController.swift
//  eDice
//
//  Created by Scott Elmer on 12/28/16.
//  Copyright © 2016 Ozmium Enterprises. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var die1: UIImageView!
    @IBOutlet weak var die2: UIImageView!
    @IBOutlet weak var die3: UIImageView!
    @IBOutlet weak var die4: UIImageView!
    @IBOutlet weak var die5: UIImageView!
    @IBOutlet weak var die6: UIImageView!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var addHumanButton: UIButton!
    @IBOutlet weak var addComputerButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var diceButtons: UIStackView!
    @IBOutlet weak var addPlayerLabel: UILabel!

    var ds = DieSet()
    
    var g = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ds.dice[0].button = die1
        ds.dice[1].button = die2
        ds.dice[2].button = die3
        ds.dice[3].button = die4
        ds.dice[4].button = die5
        ds.dice[5].button = die6
        
        for die in ds.dice {
            die.button.isUserInteractionEnabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButton(_ sender: UIButton) {
        if (ds.allFrozen()) {
            ds.unFreezeAll()
            g.currentPlayer?.turnScores.append(ds.score())
        }

        for d in ds.dice {
            if (d.frozen) {
                d.button.isUserInteractionEnabled = false
            } else {
                d.button.isUserInteractionEnabled = true
            }
            d.roll()
        }
        updateDieView()
        let s = ds.score()
        print("Score = \(s)")
        score.text = String(s)
    }

    @IBAction func go(_ sender: UIButton) {
        if (g.players.count == 0) {
            // Message that there are no players
            print("No GO!  No players")
        } else {
            g.go()
            print("Game on!")
            print("Num of players", g.players.count)
            goButton.isHidden = true
            addHumanButton.isHidden = true
            addComputerButton.isHidden = true
            addPlayerLabel.isHidden = true
            round.text = String(g.currentRound)
            playerName.text = g.getCurrentPlayerName()
        }
    }

    @IBAction func addHuman(_ sender: UIButton) {
        g.addHumanPlayer()
        print("Added Human Player")
        print("Num of players", g.players.count)
    }

    @IBAction func addComputer(_ sender: UIButton) {
        g.addComputerPlayer()
        print("Added Human Player")
        print("Num of players", g.players.count)
    }
    
    @IBAction func die1Tapped(_ sender: Any) {
        ds.dice[0].toggleFrozen()
        updateDieView()
    }

    @IBAction func die2Tapped(_ sender: Any) {
        ds.dice[1].toggleFrozen()
        updateDieView()
    }

    @IBAction func die3Tapped(_ sender: Any) {
        ds.dice[2].toggleFrozen()
        updateDieView()
    }

    @IBAction func die4Tapped(_ sender: Any) {
        ds.dice[3].toggleFrozen()
        updateDieView()
    }

    @IBAction func die5Tapped(_ sender: Any) {
        ds.dice[4].toggleFrozen()
        updateDieView()
    }

    @IBAction func die6Tapped(_ sender: Any) {
        ds.dice[5].toggleFrozen()
        updateDieView()
    }

    func updateDieView()
    {
        var dice = ds.dice

        if (dice[0].frozen) {
            die1.image = UIImage(named: Die.selectedDieAssets[dice[0].value]!)
        } else {
            die1.image = UIImage(named: Die.normalDieAssets[dice[0].value]!)
        }

        if (dice[1].frozen) {
            die2.image = UIImage(named: Die.selectedDieAssets[dice[1].value]!)
        } else {
            die2.image = UIImage(named: Die.normalDieAssets[dice[1].value]!)
        }

        if (dice[2].frozen) {
            die3.image = UIImage(named: Die.selectedDieAssets[dice[2].value]!)
        } else {
            die3.image = UIImage(named: Die.normalDieAssets[dice[2].value]!)
        }

        if (dice[3].frozen) {
            die4.image = UIImage(named: Die.selectedDieAssets[dice[3].value]!)
        } else {
            die4.image = UIImage(named: Die.normalDieAssets[dice[3].value]!)
        }

        if (dice[4].frozen) {
            die5.image = UIImage(named: Die.selectedDieAssets[dice[4].value]!)
        } else {
            die5.image = UIImage(named: Die.normalDieAssets[dice[4].value]!)
        }

        if (dice[5].frozen) {
            die6.image = UIImage(named: Die.selectedDieAssets[dice[5].value]!)
        } else {
            die6.image = UIImage(named: Die.normalDieAssets[dice[5].value]!)
        }
    }
}

