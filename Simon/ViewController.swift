//
//  ViewController.swift
//  Simon
//
//  Created by ClementM on 02/03/2018.
//  Copyright © 2018 ClementM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var colorButtons: [RoundedButton]!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet var playerLabels: [UILabel]!
    @IBOutlet var scoreLabels: [UILabel]!
    
    //MARK: - Variables
    var currentPlayer = 0
    var scores = [0, 0]
    var sequenceIndex = 0
    var colorSequence = [Int]()
    var colorsToTap = [Int]()

    //MARK: - viewDidLoad function
    override func viewDidLoad() {
        super.viewDidLoad()
        colorButtons = colorButtons.sorted() {
            $0.tag < $1.tag
        }
        playerLabels = playerLabels.sorted() {
            $0.tag < $1.tag
        }
        scoreLabels = scoreLabels.sorted() {
            $0.tag < $1.tag
        }
        createNewGame()
    }
    
    //MARK: - Custom functions
    func createNewGame() {
        colorSequence.removeAll()
        
        actionButton.setTitle("Start Game", for: .normal)
        actionButton.isEnabled = true
        for button in colorButtons {
            button.alpha = 0.5
            button.isEnabled = false
        }
    }
    
    func addNewColor() {
        colorSequence.append(Int(arc4random_uniform(UInt32(4))))
    }
    
    func playSequence() {
        if sequenceIndex < colorSequence.count {
            flashButton(button: colorButtons[colorSequence[sequenceIndex]])
            sequenceIndex += 1
        } else {
            colorsToTap = colorSequence
            view.isUserInteractionEnabled = true
            actionButton.setTitle("Your turn", for: .normal)
            for button in colorButtons {
                button.isEnabled = true
            }
        }
    }
    
    func flashButton(button: RoundedButton) {
        UIView.animate(withDuration: 0.5, animations: {
            button.alpha = 1.0
            button.alpha = 0.5
        }) { (success) in
            // Allows the rest of the sequence to be played
            self.playSequence()
        }
    }
    
    //MARK: - Actions
    @IBAction func colorButtonHandler(_ sender: RoundedButton) {
        // Checks if right color was tapped
        // and removes this entry from the array (no need for another index variable)
        if sender.tag == colorsToTap.removeFirst() {
            
        } else {
            for button in colorButtons {
                button.isEnabled = false
            }
            return
        }
        
        // Sequence successfully tapped
        if colorsToTap.isEmpty {
            for button in colorButtons {
                button.isEnabled = false
            }
            actionButton.setTitle("Continue", for: .normal)
            actionButton.isEnabled = true
        }
    }
    
    @IBAction func actionButtonHandler(_ sender: UIButton) {
        sequenceIndex = 0
        actionButton.setTitle("Memorize", for: .normal)
        actionButton.isEnabled = false
        view.isUserInteractionEnabled = false
        
        addNewColor()
        
        // Delays the code by 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.playSequence()
        }
    }
    


}

