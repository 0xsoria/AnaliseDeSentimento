//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import XCTest
@testable import FeatureTweets
import CoreProviders

final class UserNetworkTests: XCTestCase {
    
    var userNetwork: UserNetworkable?
    
    func testUserSuccess() {
        self.userNetwork = UserNetwork(network: NetworkSpySuccess())
        let expectation = XCTestExpectation(description: "expectation")
        self.userNetwork?.requestUserTweets(for: "user", completion: { (result: Result<TwitterUserWithData, Error>) in
            switch result {
            case .success(let successData):
                expectation.fulfill()
                XCTAssertFalse(successData.tweets.isEmpty)
            case .failure:
                expectation.fulfill()
                XCTFail()
            }
        })
        wait(for: [expectation], timeout: 1.0)
    }
}
