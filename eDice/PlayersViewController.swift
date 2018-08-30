import UIKit

class PlayersViewController: UITableViewController {

    // MARK: - Properties
    var players = SampleData.generatePlayersData()
}

// MARK: - IBActions
extension PlayersViewController {

    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }

    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
    }
}

// MARK: - UITableViewDataSource
extension PlayersViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)

        let player = players[indexPath.row]
        var nameStr = player.getName()
        if nameStr == "" {
            if player.isHuman() {
                nameStr = player.getType()
            } else {
                nameStr = "Computer"
            }
        }
        cell.textLabel?.text = nameStr
        cell.detailTextLabel?.text = player.getType()
        return cell
    }
}
