//
//  MainMenuViewController.swift
//  eDice
//
//  Created by Scott Elmer on 7/25/18.
//  Copyright © 2018 Ozmium Enterprises. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var startSinglePlayerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //print(startSinglePlayerButton)
        startSinglePlayerButton.layer.cornerRadius = 10
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        //print(segue.identifier!)
        if segue.identifier == "SinglePlayerGame" {
            let dest = segue.destination as! ViewController
            let g = Game()
            g.addHumanPlayer(withName: "Fudd")
            dest.game = g
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
