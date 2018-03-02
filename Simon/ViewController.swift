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
        actionButton.setTitle("Start Game", for: .normal)
        for button in colorButtons {
            button.alpha = 0.5
        }
    }
    
    //MARK: - Actions
    @IBAction func colorButtonHandler(_ sender: RoundedButton) {
        print("Button \(sender.tag) tapped.")
    }
    
    @IBAction func actionButtonHandler(_ sender: UIButton) {
        print("Action Button")
    }
    


}

