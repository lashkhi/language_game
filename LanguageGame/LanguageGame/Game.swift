//
//  Game.swift
//  LanguageGame
//
//  Created by David Lashkhi on 14.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation

final class Game {
    var words: [Word]?
    
    init() {
        setupDefaultGame()
    }
    func setupDefaultGame() {
        if let data = loadWordsDataFromFile(name: "words", type: "json") {
            if let decodedModel: [Word] = decodeJSON(from: data) {
                words = decodedModel
            }
        } else {
            print("Game setup failed")
        }
    }
    
    private func loadWordsDataFromFile(name: String, type: String) -> Data? {
        do {
            return try DataProvider.loadData(name: name, type: type)
        } catch DataProviderError.noFileFound {
            print ("No file")
        } catch DataProviderError.dataCreatingFail {
            print ("Wrong JSON")
        } catch {
            print ("Something went wrong")
        }
        return nil
    }

    private func decodeJSON<A: Codable>(from data: Data) -> [A]? {
        do {
            return try JSONDecoder().decode([A].self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
}
