//
//  Game.swift
//  LanguageGame
//
//  Created by David Lashkhi on 14.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation

enum GameAnswer {
    case incorrect
    case correct
}

final class Game {
    private var originalWords: [Word]?
    var words = [Word]()
    var wrongAnswerCount: Int = 0
    
    init(words: [Word]) {
        self.originalWords = words
    }
    
    func loadNextWords() -> Word? {
        if words.isEmpty  {
            return nil
        }
        words.remove(at: 0)
        return words.first
    }
    
    func isAnswerCorrect(for word: Word, answer:GameAnswer) -> Bool {
        switch answer {
        case .correct:
            if word.isWrongCombination { return false }
        case .incorrect:
            if !word.isWrongCombination { return false }
        }
        return true
    }
    
    func countWrongAnswer() -> String {
        wrongAnswerCount += 1
        if gameFinished() {
            return "You failed. End."
        }
        return "\(wrongAnswerCount)"
    }
    
    func gameFinished() -> Bool {
        if wrongAnswerCount == 3 { return true }
        return false
    }
}

extension Game {
    func createWordsCombination() {
        words = originalWords!.enumerated().map { word in
            word.offset % 4 == 0 ? random(word: word.element) : word.element
        }
    }
    
    func random(word: Word) -> Word {
        let filtered = originalWords!.filter { $0.spanish != word.spanish }
        let randomNumber = Int(arc4random_uniform(UInt32(filtered.count)))
        let randomWord = filtered[randomNumber]
        return Word(english: word.english, spanish: randomWord.spanish, isWrongCombination: true)
    }
}
