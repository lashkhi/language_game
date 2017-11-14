//
//  Word.swift
//  LanguageGame
//
//  Created by David Lashkhi on 14.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation

struct Word: Codable {
    let english: String
    let spanish: String
    
    enum CodingKeys: String, CodingKey {
        case english = "text_eng"
        case spanish = "text_spa"
    }
}
