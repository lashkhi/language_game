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
    

    @IBAction func wrongTap(_ sender: UIButton) {
        buttonTapped(with: .incorrect)
    }
    
    @IBAction func correctTap(_ sender: UIButton) {
        buttonTapped(with: .correct)
    }
    
    func buttonTapped(with answer: GameAnswer) {
        guard let game = game, let word = words?.first else { return }
        game.checkCorrectness(for: word, answer: answer)
        showNextWord()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

