//
//  File 2.swift
//  
//
//  Created by Gabriel Soria Souza on 23/03/21.
//

import XCTest
@testable import FeatureMoodAnalyzer
import CoreProviders

final class MoodCheckerTests: XCTestCase {
    
    var moodChecker: MoodCheckable?
    var moodDelegateSpy = MoodChekerDelegateSpy()
    
    func testSuccess() {
        self.moodChecker = MoodChecker(moodNetwork: MoodNetwork(network: NetworkSpySuccess()))
        self.moodChecker?.moodCheckerDelegate = self.moodDelegateSpy
        XCTAssertNotNil(self.moodChecker?.moodCheckerDelegate)
        self.moodChecker?.checkMood(for: "Teste")
        XCTAssertTrue(self.moodDelegateSpy.moodCalled)
    }
    
    func testFailure() {
        self.moodChecker = MoodChecker(moodNetwork: MoodNetwork(network: NetworkSpyFailure()))
        self.moodChecker?.moodCheckerDelegate = self.moodDelegateSpy
        XCTAssertNotNil(self.moodChecker?.moodCheckerDelegate)
        self.moodChecker?.checkMood(for: "Teste")
        XCTAssertTrue(self.moodDelegateSpy.errorCalled)
    }
}
