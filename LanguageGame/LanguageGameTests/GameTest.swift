//
//  GameTest.swift
//  LanguageGameTests
//
//  Created by David Lashkhi on 17.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import XCTest
@testable import LanguageGame

class GameTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameWithNoWords_ReturningNextWord_ShouldReturnNil() {
        let game = Game(words: [Word]())
        XCTAssertNil(game.loadNextWords(), "Should return nil")
    }
    
    func testGameWithOneWord_ReturningNextWord_ShouldReturnNil() {
        let game = Game(words: [Word.create()])
        XCTAssertNil(game.loadNextWords(), "Should return nil")
    }
    
    func testGameWithTwoWords_ReturningNextWord_ShouldReturnLastWord() {
        let lastWord = Word.create(english: "eng", spanish: "span", isWrongCombination: true)
        let game = Game(words: [Word.create(), lastWord])
        XCTAssertEqual(game.loadNextWords(), lastWord, "Should be equal")
    }
    
    func testCorrectTranslation_MarkedAsCorrectTranslation_ShouldReturnCorrect() {
        let word = Word.create()
        let game = Game(words: [word])
    
        let answer = game.isAnswerCorrect(for: word, answer: .correct)
        XCTAssertTrue(answer, "Answer should be correct")
    }
    
    func testCorrectTranslation_MarkedAsIncorrectTranslation_ShouldReturnIncorrect() {
        let word = Word.create()
        let game = Game(words: [word])
        
        let answer = game.isAnswerCorrect(for: word, answer: .incorrect)
        XCTAssertFalse(answer, "Answer should be incorrect")
    }
    
    func testIncorrectTranslation_MarkedAsIncorrectTranslation_ShouldReturnCorrect() {
        let word = Word.create(isWrongCombination: true)
        let game = Game(words: [word])
        
        let answer = game.isAnswerCorrect(for: word, answer: .incorrect)
        XCTAssertTrue(answer, "Answer should be correct")
    }
    
    func testIncorrectTranslation_MarkedAsCorrectTranslation_ShouldReturnIncorrect() {
        let word = Word.create(isWrongCombination: true)
        let game = Game(words: [word])
        
        let answer = game.isAnswerCorrect(for: word, answer: .correct)
        XCTAssertFalse(answer, "Answer should be incorrect")
    }
}
