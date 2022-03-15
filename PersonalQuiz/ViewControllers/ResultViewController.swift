//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalResultLabel: UILabel!
    @IBOutlet var animalDefinitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    var dogCount = 0
    var catCount = 0
    var rabbitCount = 0
    var turtleCount = 0
    
    var animalsCount: [Int] {
        [dogCount, catCount, rabbitCount, turtleCount]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getResult()
        navigationItem.hidesBackButton = true
    }
}

extension ResultViewController {
    private func calculateResult() {
        answersChosen.forEach { answer in
            if answer.animal == .dog {
                dogCount += 1
            } else if answer.animal == .cat {
                catCount += 1
            } else if answer.animal == .rabbit {
                rabbitCount += 1
            } else {
                turtleCount += 1
            }
        }
    }
    
    private func getResult() {
        calculateResult()
        
        let animalResult = animalsCount.max()
        switch animalResult {
        case dogCount:
            animalResultLabel.text = "Вы - \(Animal.dog.rawValue)"
            animalDefinitionLabel.text = Animal.dog.definition
        case catCount:
            animalResultLabel.text = "Вы - \(Animal.cat.rawValue)"
            animalDefinitionLabel.text = Animal.cat.definition
        case rabbitCount:
            animalResultLabel.text = "Вы - \(Animal.rabbit.rawValue)"
            animalDefinitionLabel.text = Animal.rabbit.definition
        default:
            animalResultLabel.text = "Вы - \(Animal.turtle.rawValue)"
            animalDefinitionLabel.text = Animal.turtle.definition
        }
    }
}
