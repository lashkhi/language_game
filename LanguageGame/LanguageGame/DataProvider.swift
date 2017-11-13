//
//  DataProvider.swift
//  LanguageGame
//
//  Created by David Lashkhi on 13.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation

enum DataProviderError: Error {
    case noFileFound
    case dataCreatingFail
}

class DataProvider {
    static func loadJSON(name: String) -> Data? {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
                return data
            } catch {
                print("DataProvider: Error reading JSON file")
            }
        }
        print ("DataProvider: File not found")
        return nil
    }
    
    static func loadJSON2(name: String) throws -> Data {
        guard let filePath = Bundle.main.path(forResource: name, ofType: "json")
            else { throw DataProviderError.noFileFound }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
            else { throw DataProviderError.dataCreatingFail }
        return data
    }
}
