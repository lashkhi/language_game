//
//  Game.swift
//  LanguageGame
//
//  Created by David Lashkhi on 14.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation

final class Game {
    private var words: [Word]?
    
    init(words: [Word]) {
        self.words = words
    }
    
    func createWordsCombination() {
        var newWords = [Word]()
        for (index, word) in words!.enumerated() {
            var newWord = word
            if index % 4 == 0 {
                let randomWord = chooseRandomWordAndCompare(word: word)
                newWord = Word(english: word.english, spanish: randomWord.spanish, isWrongCombination: true)
            }
            newWords.append(newWord)
        }
    }
    
    func chooseRandomWordAndCompare(word: Word) -> Word {
        let randomNumber = Int(arc4random_uniform(UInt32(words!.count)))
        var randomWord = words![randomNumber]
        if randomWord.spanish == word.spanish {
            randomWord = chooseRandomWordAndCompare(word: word)
        }
        return randomWord
    }
    
}
