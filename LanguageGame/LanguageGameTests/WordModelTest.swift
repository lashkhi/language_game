//
//  WordModelTest.swift
//  LanguageGameTests
//
//  Created by David Lashkhi on 17.11.17.
//  Copyright © 2017 David Lashkhi. All rights reserved.
//

import XCTest
@testable import LanguageGame

class WordModelTest: XCTestCase {
    var json: String!
    var word: Word!
    
    override func setUp() {
        super.setUp()
        json = """
        {
        "text_eng":"primary school",
        "text_spa":"escuela primaria"
        }
        """
    }
    
    override func tearDown() {
        json = nil
        word = nil
        super.tearDown()
    }
    
    func testModelUnwrap() {
        let data = json.data(using: .utf8)
        assert(data != nil, "json should be convertible to Data")
        
        do {
            word = try JSONDecoder().decode(Word.self, from: data!)
        } catch {
            print("\(error) converting JSON)")
        }
        
        XCTAssertEqual(word.english, "primary school", "English is wrong")
        XCTAssertEqual(word.spanish, "escuela primaria", "Spanish is wrong")
    }
    
}
