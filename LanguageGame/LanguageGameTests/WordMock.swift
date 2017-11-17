//
//  WordMock.swift
//  LanguageGameTests
//
//  Created by David Lashkhi on 17.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation
@testable import LanguageGame

extension Word {
    static func create(
        english: String = "holidays",
        spanish: String = "vacaciones",
        isWrongCombination: Bool = false) -> Word {
        return Word(english: english, spanish: spanish, isWrongCombination: isWrongCombination)
    }
}
