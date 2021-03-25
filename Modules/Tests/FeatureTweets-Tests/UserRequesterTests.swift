//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 24/03/21.
//

import XCTest
@testable import FeatureTweets
import CoreProviders

final class UserRequesterTests: XCTestCase {
    
    var userRequester: UserRequestable?
    var delegate = UserDelegateSpy()
    
    func testSuccess() {
        self.userRequester = UserRequester(network: UserNetworkSuccessSpy())
        self.userRequester?.userRequesterDelegate = self.delegate
        self.userRequester?.fetchUser("user")
        XCTAssertTrue(self.delegate.didReceiveTweetsCalled)
    }
    
    func testFailure() {
        self.userRequester = UserRequester(network: UserNetworkFailureSpy())
        self.userRequester?.userRequesterDelegate = self.delegate
        self.userRequester?.fetchUser("user")
        XCTAssertTrue(self.delegate.didReceiveErrorCalled)
    }
}
