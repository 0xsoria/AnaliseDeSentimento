//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 23/03/21.
//

import Foundation

protocol UserRequesterDelegate: AnyObject {
    func didReceive(_ user: [TweetData])
    func didReceiveError()
}

protocol UserRequestable {
    var userRequesterDelegate: UserRequesterDelegate? { get set }
    func fetchUser(_ userName: String)
}

final class UserRequester: UserRequestable {

    weak var userRequesterDelegate: UserRequesterDelegate?
    private let network: UserNetworkable
    
    init(network: UserNetworkable) {
        self.network = network
    }

    func fetchUser(_ userName: String) {
        self.fetchUserTweets(userName)
    }
    
    private func fetchUserTweets(_ userName: String) {
        self.network.requestUserTweets(for: userName) { (result: Result<[TweetData], Error>) in
            switch result {
            case .success(let userTweets):
                self.userRequesterDelegate?.didReceive(userTweets)
            case .failure:
                self.userRequesterDelegate?.didReceiveError()
            }
        }
    }
}
