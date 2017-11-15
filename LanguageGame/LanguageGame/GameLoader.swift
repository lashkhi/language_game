//
//  GameLoader.swift
//  LanguageGame
//
//  Created by David Lashkhi on 15.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation

final class GameLoader {
    
    static func createDefault() -> Game? {
        return createFrom(name: "words", type: "json")
    }
    
    static func createFrom(name: String, type: String) -> Game? {
        guard let data = dataFrom(name: name, type: type) else {
            print("Words loading from words.json failed")
            return nil
        }
        
        guard let words: [Word] = decodeJSON(from: data) else {
            print("Words decoding failed. Source: \n\(data)")
            return nil
        }
        return Game(words: words)
    }
    
    
    private static func dataFrom(name: String, type: String) -> Data? {
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
    
    private static func decodeJSON<A: Codable>(from data: Data) -> [A]? {
        do {
            return try JSONDecoder().decode([A].self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
}
