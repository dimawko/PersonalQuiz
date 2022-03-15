
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
        let animalCountedSet = NSCountedSet(array: answersChosen)
        guard let animalResult = answersChosen.max(by: { animalCountedSet.count(for: $0) < animalCountedSet.count(for: $1) }) else { return }
        animalResultLabel.text = "Вы - \(animalResult.animal.rawValue)"
        animalDefinitionLabel.text = animalResult.animal.definition
    }
}

