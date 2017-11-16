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
    
    func checkCorrectness(for word: Word, answer:GameAnswer) {
        switch answer {
        case .correct:
            if word.isWrongCombination { print("fail") }
        case .incorrect:
            if word.isWrongCombination { print("correct") }
        }
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
