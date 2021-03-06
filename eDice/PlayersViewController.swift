import UIKit

class PlayersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var skillPicker1: UIPickerView!

    // MARK: - Properties
    var players = SampleData.generatePlayersData()
    var pickerData: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data:
        self.skillPicker1.delegate = self
        self.skillPicker1.dataSource = self

        pickerData = ["Beginner", "Average", "Expert"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
}
// MARK: - IBActions
extension PlayersViewController {
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
    }
}
