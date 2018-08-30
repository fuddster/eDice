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
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var bankButton: UIButton!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var diceButtons: UIStackView!

    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()

        rollButton.layer.cornerRadius = 10
        bankButton.layer.cornerRadius = 10

        guard let dieSet = game?.dieSet else {
            return
        }
        // Do any additional setup after loading the view, typically from a nib.
        dieSet.dice[0].button = die1
        dieSet.dice[1].button = die2
        dieSet.dice[2].button = die3
        dieSet.dice[3].button = die4
        dieSet.dice[4].button = die5
        dieSet.dice[5].button = die6

        for die in dieSet.dice {
            die.button.isUserInteractionEnabled = false
        }

        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButton(_ sender: UIButton) {
        guard let game = game else {
            return
        }

        var rollButton = true
        if sender.restorationIdentifier == "Bank" {
            rollButton = false
        }

        // First roll - skip some of this
        if !game.newTurn {
            // Can't roll without selecting at least one die
            if game.dieSet.countSelected() < 1 {
                // Pop up warning
                showAlert("You must select at least on die")
                return
            }
        } else {
            game.newTurn = false
        }

        // User selected a dice that doesn't contribute to scoring
        if game.dieSet.nonScoringDiceSelected() {
            // Pop up warning
            showAlert("All selected dice must contribute to the score")
            return
        }

        // Update roll score
        updateRollScore()

        // Update turn score
        game.currentPlayer.addToTurnScores(game.dieSet.score())
        turnScore.text = String(game.currentPlayer.totalTurnScore())

        // Move selected dice to frozen row
        game.dieSet.moveSelectedToFrozen()
        updateDieView()

        // Reset if all dice selected
        if game.dieSet.allFrozen() {
            game.dieSet.unFreezeAll()
        }

        // Disable dice button
        for die in game.dieSet.dice {
            if die.frozen {
                die.button.isUserInteractionEnabled = false
            } else {
                die.button.isUserInteractionEnabled = true
            }
        }

        if rollButton {
            game.dieSet.rollAll()
            updateDieView()
            if game.dieSet.score(false) == 0 {
                // Bust - End of turn
                game.newTurn = true
                nextPlayerSetup(true)
            }
        } else {
            // Bank button
            game.currentPlayer.addToRoundScores(game.currentPlayer.totalTurnScore())
            playerScore.text = String(game.currentPlayer.totalRoundScore())
            game.newTurn = true
            nextPlayerSetup(false)
        }
        round.text = String(game.currentRound)
    }

    @IBAction func die1Tapped(_ sender: Any) {
        game?.dieSet.dice[0].toggleSelected()
        updateDieView()
    }

    @IBAction func die2Tapped(_ sender: Any) {
        game?.dieSet.dice[1].toggleSelected()
        updateDieView()
    }

    @IBAction func die3Tapped(_ sender: Any) {
        game?.dieSet.dice[2].toggleSelected()
        updateDieView()
    }

    @IBAction func die4Tapped(_ sender: Any) {
        game?.dieSet.dice[3].toggleSelected()
        updateDieView()
    }

    @IBAction func die5Tapped(_ sender: Any) {
        game?.dieSet.dice[4].toggleSelected()
        updateDieView()
    }

    @IBAction func die6Tapped(_ sender: Any) {
        game?.dieSet.dice[5].toggleSelected()
        updateDieView()
    }

    func blankDieView() {
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
    }

    func updateDieView() {
        guard let game = game else {
            return
        }

        var dice = game.dieSet.dice

        if game.newTurn {
            blankDieView()
            updateRollScore()
            return
        }

        if dice[0].frozen {
            frozenDie1.image = UIImage(named: Die.selectedDieAssets[dice[0].value]!)
            die1.image = nil
        } else {
            if dice[0].selected {
                die1.image = UIImage(named: Die.selectedDieAssets[dice[0].value]!)
            } else {
                die1.image = UIImage(named: Die.normalDieAssets[dice[0].value]!)
            }
            frozenDie1.image = nil
        }

        if dice[1].frozen {
            frozenDie2.image = UIImage(named: Die.selectedDieAssets[dice[1].value]!)
            die2.image = nil
        } else {
            if dice[1].selected {
                die2.image = UIImage(named: Die.selectedDieAssets[dice[1].value]!)
            } else {
                die2.image = UIImage(named: Die.normalDieAssets[dice[1].value]!)
            }
            frozenDie2.image = nil
        }

        if dice[2].frozen {
            frozenDie3.image = UIImage(named: Die.selectedDieAssets[dice[2].value]!)
            die3.image = nil
        } else {
            if dice[2].selected {
                die3.image = UIImage(named: Die.selectedDieAssets[dice[2].value]!)
            } else {
                die3.image = UIImage(named: Die.normalDieAssets[dice[2].value]!)
            }
            frozenDie3.image = nil
        }

        if dice[3].frozen {
            frozenDie4.image = UIImage(named: Die.selectedDieAssets[dice[3].value]!)
            die4.image = nil
        } else {
            if dice[3].selected {
                die4.image = UIImage(named: Die.selectedDieAssets[dice[3].value]!)
            } else {
                die4.image = UIImage(named: Die.normalDieAssets[dice[3].value]!)
            }
            frozenDie4.image = nil
        }

        if dice[4].frozen {
            frozenDie5.image = UIImage(named: Die.selectedDieAssets[dice[4].value]!)
            die5.image = nil
        } else {
            if dice[4].selected {
                die5.image = UIImage(named: Die.selectedDieAssets[dice[4].value]!)
            } else {
                die5.image = UIImage(named: Die.normalDieAssets[dice[4].value]!)
            }
            frozenDie5.image = nil
        }

        if dice[5].frozen {
            frozenDie6.image = UIImage(named: Die.selectedDieAssets[dice[5].value]!)
            die6.image = nil
        } else {
            if dice[5].selected {
                die6.image = UIImage(named: Die.selectedDieAssets[dice[5].value]!)
            } else {
                die6.image = UIImage(named: Die.normalDieAssets[dice[5].value]!)
            }
            frozenDie6.image = nil
        }

        updateRollScore()
    }

    func updateRollScore() {
        guard let game = game else {
            return
        }

        let rScore = game.dieSet.score()
        //print("Score = \(rScore)")
        //print("Turn Score = \(game.currentPlayer.totalTurnScore())")
        rollScore.text = String(rScore)
        turnScore.text = String(game.currentPlayer.totalTurnScore() + rScore)
    }

    func nextPlayerSetup(_ bust: Bool = true) {
        guard let game = game else {
            return
        }

        game.currentPlayer.resetTurnScores()
        game.dieSet.unSelectAll()
        game.dieSet.unFreezeAll()
        game.nextPlayer()
        if game.currentRound > game.numOfRounds {
            // Game over
            // Display final score
            var message = "Game Over"
            if game.numOfPlayers() == 1 {
                message = "\nFinal Score: \(game.currentPlayer.totalRoundScore())"
            }
            game.currentPlayer.resetTurnScores()
            game.currentPlayer.resetRoundScores()
            game.go()
            let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK",
                                         style: UIAlertActionStyle.default,
                                         handler: { (_)in
                self.performSegue(withIdentifier: "unwindToMenu", sender: self)
            })

            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            var message = ""
            // Display next player pop up
            if bust {
                if game.players.count != 1 {
                    message = "Next player: \(game.currentPlayer.getName())"
                }
                showAlert(message, "Bust!")
            } else {
                showAlert(message, "Score Banked!")
            }
        }
        playerName.text = game.currentPlayer.getName()
        playerScore.text = String(game.currentPlayer.totalRoundScore())
    }

    func showAlert(_ message: String = "", _ title: String = "Alert") {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertActionStyle.default,
                                                handler: {_ in self.updateDieView() }))

        self.present(alertController, animated: true, completion: nil)
    }

    func startGame() {
        guard let game = game else {
            return
        }

        game.go()
        round.text = String(game.currentRound)
        playerName.text = game.currentPlayer.getName()
    }
}
