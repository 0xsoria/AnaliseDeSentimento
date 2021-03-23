//
//  File 2.swift
//  
//
//  Created by Gabriel Soria Souza on 23/03/21.
//

import XCTest
@testable import FeatureMoodAnalyzer
import CoreProviders

final class MoodNumberAnalyzerTests: XCTestCase {
    
    func test() {
        let randomHappy = Double.random(in: 0.5...1)
        let happy = MoodNumbersAnalyzer(magnitude: 1.0, score: randomHappy)
        let result = happy.analyze()
        XCTAssertTrue(result == "😁")
        
        let randomNeutral = Double.random(in: 0.1...0.4)
        let neutral = MoodNumbersAnalyzer(magnitude: 1.0, score: randomNeutral)
        let resultNeutral = neutral.analyze()
        XCTAssertTrue(resultNeutral == "😐")
        
        let randomUnhappy = Double.random(in: (-1.0)...0.0)
        let unhappy = MoodNumbersAnalyzer(magnitude: 1.0, score: randomUnhappy)
        let resultUnhappy = unhappy.analyze()
        XCTAssertTrue(resultUnhappy == "☹️")
    }
}
