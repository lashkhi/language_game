//
//  WordMock.swift
//  LanguageGameTests
//
//  Created by David Lashkhi on 17.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import Foundation
@testable import LanguageGame

extension Word: Equatable {
    static func create(
        english: String = "holidays",
        spanish: String = "vacaciones",
        isWrongCombination: Bool = false) -> Word {
        return Word(english: english, spanish: spanish, isWrongCombination: isWrongCombination)
    }
    
    public static func == (lhs: Word, rhs: Word) -> Bool {
        return (lhs.english == rhs.english) && (lhs.spanish == rhs.spanish) && (lhs.isWrongCombination == rhs.isWrongCombination)
    }
}
