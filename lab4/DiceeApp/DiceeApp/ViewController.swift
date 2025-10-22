//
//  ViewController.swift
//  DiceeApp
//
//  Created by Zhalgas Bagytzhan on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let diceImages: [UIImage] = [
        #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")
    ]
    
    let diceImagesEnum: [UIImage] = [
        .diceOne, .diceTwo, .diceThree, .diceFour, .diceFive, .diceSix
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        leftDice.image = .diceOne
        rightDice.image = .diceTwo
        rollButton.layer.cornerRadius = 16
        rollButton.backgroundColor = .systemBlue
    }
    
    func rollDices() {
        let randomNumber1 = Int.random(in: 0..<diceImages.count)
        let randomNumber2 = Int.random(in: 0..<diceImages.count)
        leftDice.image = diceImages[randomNumber1]
        rightDice.image = diceImages[randomNumber2]
    }
    
    @IBAction func rollDice(_ sender: UIButton) {
        rollDices()
    }
    
    override var canBecomeFirstResponder: Bool {
            return true
        }

    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            becomeFirstResponder()
        }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDices()
        }
    }
    
}

