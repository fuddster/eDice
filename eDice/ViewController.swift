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
    @IBOutlet weak var frozenDie1: UIImageView!
    @IBOutlet weak var frozenDie2: UIImageView!
    @IBOutlet weak var frozenDie3: UIImageView!
    @IBOutlet weak var frozenDie4: UIImageView!
    @IBOutlet weak var frozenDie5: UIImageView!
    @IBOutlet weak var frozenDie6: UIImageView!
    @IBOutlet weak var rollScore: UILabel!
    @IBOutlet weak var turnScore: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var addHumanButton: UIButton!
    @IBOutlet weak var addComputerButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var diceButtons: UIStackView!
    @IBOutlet weak var addPlayerLabel: UILabel!
    @IBOutlet weak var startSinglePlayer: UIButton!

    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let ds = game?.ds else {
            return
        }
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

        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButton(_ sender: UIButton) {
        guard let g = game else {
            return
        }

        var rollButton = true
        if (sender.restorationIdentifier == "Bank") {
            rollButton = false
        }

        // First roll - skip some of this
        if (!g.newTurn) {
            // Can't roll without selecting at least one die
            if (g.ds.countSelected() < 1){
                // Pop up warning
                showAlert("You must select at least on die")
                return
            }
        } else {
            g.newTurn = false
        }

        // User selected a dice that doesn't contribute to scoring
        if (g.ds.nonScoringDiceSelected()) {
            // Pop up warning
            showAlert("All selected dice must contribute to the score")
            return
        }

        // Update roll score
        updateRollScore()

        // Update turn score
        g.currentPlayer.addToTurnScores(g.ds.score())
        turnScore.text = String(g.currentPlayer.totalTurnScore())

        // Move selected dice to frozen row
        g.ds.moveSelectedToFrozen()
        updateDieView()

        // Reset if all dice selected
        if (g.ds.allFrozen()) {
            g.ds.unFreezeAll()
        }
        
        // Disable dice button
        for d in g.ds.dice {
            if (d.frozen) {
                d.button.isUserInteractionEnabled = false
            } else {
                d.button.isUserInteractionEnabled = true
            }
        }

        if (rollButton) {
            g.ds.rollAll()
            updateDieView()
            if (g.ds.score(false) == 0) {
                // Bust - End of turn
                g.newTurn = true
                nextPlayerSetup(true)
                round.text = String(g.currentRound)
            }
        } else {
            // Bank button
            g.currentPlayer.addToRoundScores(g.currentPlayer.totalTurnScore())
            playerScore.text = String(g.currentPlayer.totalRoundScore())
            g.newTurn = true
            nextPlayerSetup(false)
        }
    }

    @IBAction func go(_ sender: UIButton) {
        guard let g = game else {
            return
        }
        
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

    @IBAction func die1Tapped(_ sender: Any) {
        game?.ds.dice[0].toggleSelected()
        updateDieView()
    }

    @IBAction func die2Tapped(_ sender: Any) {
        game?.ds.dice[1].toggleSelected()
        updateDieView()
    }

    @IBAction func die3Tapped(_ sender: Any) {
        game?.ds.dice[2].toggleSelected()
        updateDieView()
    }

    @IBAction func die4Tapped(_ sender: Any) {
        game?.ds.dice[3].toggleSelected()
        updateDieView()
    }

    @IBAction func die5Tapped(_ sender: Any) {
        game?.ds.dice[4].toggleSelected()
        updateDieView()
    }

    @IBAction func die6Tapped(_ sender: Any) {
        game?.ds.dice[5].toggleSelected()
        updateDieView()
    }

    func updateDieView()
    {
        guard let g = game else {
            return
        }
        
        var dice = g.ds.dice

        if (g.newTurn) {
            die1.image = nil
            die2.image = nil
            die3.image = nil
            die4.image = nil
            die5.image = nil
            die6.image = nil
            frozenDie1.image = nil
            frozenDie2.image = nil
            frozenDie3.image = nil
            frozenDie4.image = nil
            frozenDie5.image = nil
            frozenDie6.image = nil
            return
        }

        if (dice[0].frozen) {
            frozenDie1.image = UIImage(named: Die.selectedDieAssets[dice[0].value]!)
            die1.image = nil
        } else {
            if (dice[0].selected) {
                die1.image = UIImage(named: Die.selectedDieAssets[dice[0].value]!)
            } else {
                die1.image = UIImage(named: Die.normalDieAssets[dice[0].value]!)
            }
            frozenDie1.image = nil
        }

        if (dice[1].frozen) {
            frozenDie2.image = UIImage(named: Die.selectedDieAssets[dice[1].value]!)
            die2.image = nil
        } else {
            if (dice[1].selected) {
                die2.image = UIImage(named: Die.selectedDieAssets[dice[1].value]!)
            } else {
                die2.image = UIImage(named: Die.normalDieAssets[dice[1].value]!)
            }
            frozenDie2.image = nil
        }
        
        if (dice[2].frozen) {
            frozenDie3.image = UIImage(named: Die.selectedDieAssets[dice[2].value]!)
            die3.image = nil
        } else {
            if (dice[2].selected) {
                die3.image = UIImage(named: Die.selectedDieAssets[dice[2].value]!)
            } else {
                die3.image = UIImage(named: Die.normalDieAssets[dice[2].value]!)
            }
            frozenDie3.image = nil
        }

        if (dice[3].frozen) {
            frozenDie4.image = UIImage(named: Die.selectedDieAssets[dice[3].value]!)
            die4.image = nil
        } else {
            if (dice[3].selected) {
                die4.image = UIImage(named: Die.selectedDieAssets[dice[3].value]!)
            } else {
                die4.image = UIImage(named: Die.normalDieAssets[dice[3].value]!)
            }
            frozenDie4.image = nil
        }

        if (dice[4].frozen) {
            frozenDie5.image = UIImage(named: Die.selectedDieAssets[dice[4].value]!)
            die5.image = nil
        } else {
            if (dice[4].selected) {
                die5.image = UIImage(named: Die.selectedDieAssets[dice[4].value]!)
            } else {
                die5.image = UIImage(named: Die.normalDieAssets[dice[4].value]!)
            }
            frozenDie5.image = nil
        }

        if (dice[5].frozen) {
            frozenDie6.image = UIImage(named: Die.selectedDieAssets[dice[5].value]!)
            die6.image = nil
        } else {
            if (dice[5].selected) {
                die6.image = UIImage(named: Die.selectedDieAssets[dice[5].value]!)
            } else {
                die6.image = UIImage(named: Die.normalDieAssets[dice[5].value]!)
            }
            frozenDie6.image = nil
        }

        updateRollScore()
    }

    func updateRollScore() {
        let rs = game!.ds.score()
        //print("Score = \(rs)")
        rollScore.text = String(rs)
    }

    func nextPlayerSetup(_ bust: Bool = true) {
        guard let g = game else {
            return
        }
        
        print("Next Player!")
        g.currentPlayer.resetTurnScores()
        print("Unselect/Unfreeze all")
        g.ds.unSelectAll()
        g.ds.unFreezeAll()
        g.nextPlayer()
        playerName.text = g.currentPlayer.getName()
        if (g.currentRound > g.numOfRounds) {
            // Game over
            // Display final score
            showAlert("", "Game Over")
            g.currentPlayer.resetTurnScores()
            g.currentPlayer.resetRoundScores()
            g.go()
        } else {
            // Display next player pop up
            if (bust) {
                showAlert("Next player: \(g.currentPlayer.getName())", "Bust!")
            } else {
                showAlert("Next player: \(g.currentPlayer.getName())", "Score Banked!")
            }
        }
    }

    func showAlert(_ message: String = "", _ title: String = "Alert") {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: {_ in self.updateDieView() }))

        self.present(alertController, animated: true, completion: nil)
    }

    func startGame() {
        guard let g = game else {
            return
        }

        g.go()
        round.text = String(g.currentRound)
        playerName.text = g.currentPlayer.getName()
    }
}

