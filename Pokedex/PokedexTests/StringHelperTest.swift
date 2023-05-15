//
//  StringHelperTest.swift
//  PokedexTests
//
//  Created by Demian Tejo on 15/05/2023.
//

import XCTest
@testable import Pokedex

class StringExtensionTests: XCTestCase {

    func testCapitalizedFirstLetter_EmptyString() {
        // Given
        let input = ""

        // When
        let result = input.capitalizedFirstLetter()

        // Then
        XCTAssertEqual(result, "")
    }

    func testCapitalizedFirstLetter_SingleCharacterString() {
        // Given
        let input = "a"

        // When
        let result = input.capitalizedFirstLetter()

        // Then
        XCTAssertEqual(result, "A")
    }

    func testCapitalizedFirstLetter_AllLowercaseString() {
        // Given
        let input = "hello"

        // When
        let result = input.capitalizedFirstLetter()

        // Then
        XCTAssertEqual(result, "Hello")
    }

    func testCapitalizedFirstLetter_AllUppercaseString() {
        // Given
        let input = "WORLD"

        // When
        let result = input.capitalizedFirstLetter()

        // Then
        XCTAssertEqual(result, "WORLD")
    }

    func testCapitalizedFirstLetter_MixedCaseString() {
        // Given
        let input = "tEstinG"

        // When
        let result = input.capitalizedFirstLetter()

        // Then
        XCTAssertEqual(result, "TEstinG")
    }
}
