//
//  Game.swift
//  Apple Pie
//
//  Created by AA1 on 13/08/17.
//  Copyright © 2017 AA1. All rights reserved.
//

import Foundation
struct Game {
    var word: String
    var incorrectMovesRemaining: Int8
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word.characters {
            if guessedLetters.contains(letter) {
                guessedWord += String(letter)
            }
            else {
                guessedWord += "_"
            }
            
        }
        return guessedWord
    }
}
