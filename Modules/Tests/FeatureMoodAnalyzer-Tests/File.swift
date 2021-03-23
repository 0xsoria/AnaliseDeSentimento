//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import XCTest
@testable import FeatureMoodAnalyzer
import CoreProviders

final class MoodNetworkTests: XCTestCase {

    var moodRequester: MoodNetwork?

    func test() {
        self.moodRequester = MoodNetwork(network: NetworkSpySuccess())
        let expectation = XCTestExpectation(description: "expect mood to be success")
        self.moodRequester?.requestMoodAnalysis(moodString: "estou feliz", completion: { (result: Result<String, Errors>) in
            switch result {
            case .success(let data):
                expectation.fulfill()
                XCTAssertTrue(!data.isEmpty)
            case .failure:
                expectation.fulfill()
                XCTFail()
            }
        })
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFailure() {
        self.moodRequester = MoodNetwork(network: NetworkSpyFailure())
        let expectation = XCTestExpectation(description: "expect failure")
        self.moodRequester?.requestMoodAnalysis(moodString: "triste", completion: { (result: Result<String, Errors>) in
            switch result {
            case .failure(let error):
                expectation.fulfill()
                XCTAssertTrue(error == .error)
            default:
                expectation.fulfill()
                XCTFail()
            }
        })
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFailureDecoding() {
        self.moodRequester = MoodNetwork(network: NetworkSpySuccessButErrorData())
        let expectation = XCTestExpectation(description: "expect failure")
        self.moodRequester?.requestMoodAnalysis(moodString: "ops", completion: { (result: Result<String, Errors>) in
            switch result {
            case .failure(let error):
                expectation.fulfill()
                XCTAssertTrue(error == .error)
            default:
                expectation.fulfill()
                XCTFail()
            }
        })
        wait(for: [expectation], timeout: 1.0)
    }
}
