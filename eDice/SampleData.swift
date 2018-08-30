import Foundation

final class SampleData {

    static func generatePlayersData() -> [Player] {
        return [
            Player(withName: "Bill Evans"),
            Player(withType: "Beginner"),
            Player(withType: "Average"),
            Player(withType: "Expert")
        ]
    }
}
