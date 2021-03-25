//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 24/03/21.
//

@testable import FeatureTweets

final class UserDelegateSpy: UserRequesterDelegate {
    
    var didReceiveTweetsCalled = false
    var didReceiveErrorCalled = false
    
    func didReceive(_ user: TwitterUserWithData) {
        self.didReceiveTweetsCalled = true
    }
    
    func didReceiveError() {
        self.didReceiveErrorCalled = true
    }
}
