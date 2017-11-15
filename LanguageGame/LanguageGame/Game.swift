//
//  Game.swift
//  LanguageGame
//
//  Created by David Lashkhi on 14.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation

final class Game {
    private var originalWords: [Word]?
    var words = [Word]()
    
    init(words: [Word]) {
        self.originalWords = words
    }
    
    func createWordsCombination() {
        for (index, word) in originalWords!.enumerated() {
            var newWord = word
            if index % 4 == 0 {
                let randomWord = chooseRandomWordAndCompare(word: word)
                newWord = Word(english: word.english, spanish: randomWord.spanish, isWrongCombination: true)
            }
            words.append(newWord)
        }
    }
    
    func chooseRandomWordAndCompare(word: Word) -> Word {
        let randomNumber = Int(arc4random_uniform(UInt32(originalWords!.count)))
        var randomWord = originalWords![randomNumber]
        if randomWord.spanish == word.spanish {
            randomWord = chooseRandomWordAndCompare(word: word)
        }
        return randomWord
    }
    
    func loadNextWords() -> Word? {
        if words.isEmpty  {
            return nil
        }
        words.remove(at: 0)
        return words.first
    }
    
}
