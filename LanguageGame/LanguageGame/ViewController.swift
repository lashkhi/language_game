//
//  ViewController.swift
//  LanguageGame
//
//  Created by David Lashkhi on 13.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var english: UILabel!
    @IBOutlet weak var translation: UILabel!
    @IBOutlet weak var wrongAnswerCounter: UILabel!
    
    var game: Game?
    var words: [Word]?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let defaultGame = GameLoader.createDefault() {
            start(game: defaultGame)
            updateLabelsWith(word: words!.first!)
        }
    }
    
    func start(game: Game) {
        self.game = game
        game.createWordsCombination()
        words = game.words
    }
    
    func updateLabelsWith(word: Word) {
        english.text = word.english
        translation.text = word.spanish
    }
    
    func showNextWord() {
        if let word = game?.loadNextWords() {
            words = game?.words
            updateLabelsWith(word: word)
        } else { print("Game finished") }
    }
    
    func checkCorrectness(for word: Word, answer: GameAnswer) {
        guard let game = game else { return }
        if game.isAnswerCorrect(for: word, answer: answer) {
            print("Correct answer")
        } else {
            print("Wrong answer")
            countWrongAnswer()
        }
    }
    
    func countWrongAnswer() {
        guard var counter = Int(wrongAnswerCounter.text!) else { return }
        counter = counter + 1
        wrongAnswerCounter.text = "\(counter)"
    }
    

    @IBAction func wrongTap(_ sender: UIButton) {
        buttonTapped(with: .incorrect)
    }
    
    @IBAction func correctTap(_ sender: UIButton) {
        buttonTapped(with: .correct)
    }
    
    func buttonTapped(with answer: GameAnswer) {
        guard let word = words?.first else { return }
        checkCorrectness(for: word, answer: answer)
        showNextWord()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

