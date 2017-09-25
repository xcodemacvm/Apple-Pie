//
//  ViewController.swift
//  Apple Pie
//
//  Created by AA1 on 12/08/17.
//  Copyright © 2017 AA1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var listOfWords = ["banana", "laranja", "abacate", "melancia"]
    private let incorrectMovesAllowed: Int8 = 7
    
    private var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    private var totalLosses: Int = 0 {
        didSet {
            newRound()
        }
    }
    
    private var currentGame: Game!
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character((letterString.lowercased()))
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }
        else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        scoreLabel.text = "Total wins: \(totalWins) Total losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }
   }

}
