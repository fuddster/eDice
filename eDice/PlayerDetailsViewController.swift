//
//  PlayerDetailsViewController.swift
//  eDice
//
//  Created by Scott Elmer on 8/24/18.
//  Copyright © 2018 Ozmium Enterprises. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate
extension PlayerDetailsViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            nameTextField.becomeFirstResponder()
        }
    }
}
