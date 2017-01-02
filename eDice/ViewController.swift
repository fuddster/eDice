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

    var dieSet = [Die]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButton(_ sender: UIButton) {
        for d in dieSet {
            d.roll()
        }
        updateDieView()
    }

    func updateDieView() {
        die1.image = UIImage(named: Die.dieAssets[dieSet[0].value]!)
        die2.image = UIImage(named: Die.dieAssets[dieSet[1].value]!)
        die3.image = UIImage(named: Die.dieAssets[dieSet[2].value]!)
        die4.image = UIImage(named: Die.dieAssets[dieSet[3].value]!)
        die5.image = UIImage(named: Die.dieAssets[dieSet[4].value]!)
        die6.image = UIImage(named: Die.dieAssets[dieSet[5].value]!)
    }
}

