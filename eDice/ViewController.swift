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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Making a change again")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButton(_ sender: UIButton) {
    }

}

