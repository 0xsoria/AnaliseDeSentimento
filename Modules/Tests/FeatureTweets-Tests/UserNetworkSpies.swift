//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 24/03/21.
//

import XCTest
@testable import FeatureTweets
import CoreProviders

final class UserNetworkSuccessSpy: UserNetworkable {
    func requestUserTweets(for userName: String, completion: @escaping ((Result<[TweetData], Error>) -> Void)) {
        completion(.success([]))
    }
}

final class UserNetworkFailureSpy: UserNetworkable {
    func requestUserTweets(for userName: String, completion: @escaping ((Result<[TweetData], Error>) -> Void)) {
        completion(.failure(NetworkError.noResponse))
    }
}
