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
    func requestUserTweets(for userName: String, completion: @escaping ((Result<TwitterUserWithData, Error>) -> Void)) {
        completion(.success(TwitterUserWithData(user: TwitterUser(data: TwitterUserData(id: String(),
                                                                                        name: String(),
                                                                                        username: String())),
                                                tweets: [])))
    }
}

final class UserNetworkFailureSpy: UserNetworkable {
    func requestUserTweets(for userName: String, completion: @escaping ((Result<TwitterUserWithData, Error>) -> Void)) {
        completion(.failure(NetworkError.noResponse))
    }
}
