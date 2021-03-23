//
//  File 2.swift
//  
//
//  Created by Gabriel Soria Souza on 23/03/21.
//

import XCTest
@testable import FeatureMoodAnalyzer
import CoreProviders

final class MoodChekerDelegateSpy: MoodCheckerDelegate {
    
    private(set) var errorCalled = false
    private(set) var moodCalled = false
    
    func didReceive(_ mood: String) {
        self.moodCalled = true
    }
    
    func didReceiveError() {
        self.errorCalled = true
    }
}
