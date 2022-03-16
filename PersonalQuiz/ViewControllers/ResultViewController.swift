
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalResultLabel: UILabel!
    @IBOutlet var animalDefinitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getResult()
        navigationItem.hidesBackButton = true
    }
    
    private func getResult() {
        let animalValues = answersChosen.reduce(into: [:], { $0[$1, default: 0] += 1 })
        guard let animalResult = animalValues.max(by: { $0.value < $1.value }) else { return }
        animalResultLabel.text = "Вы - \(animalResult.key.animal.rawValue)"
        animalDefinitionLabel.text = animalResult.key.animal.definition
    }
}
