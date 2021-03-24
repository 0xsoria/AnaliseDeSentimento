//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 24/03/21.
//

import CoreProviders
import Foundation
import RootElements

protocol UserNetworkable {
    func requestUserTweets(for userName: String, completion: @escaping ((Result<[TweetData], Error>) -> Void))
}

final class UserNetwork: UserNetworkable {

    private let network: NetworkServiceable
    private let apiHeaders = [APIKeys.Constants.contentType: APIKeys.Constants.applicationJSON,
                              APIKeys.Constants.bearerHeader: "\(APIKeys.Constants.bearerHeader)\(PlistKey.twitterBearerToken.getData())"]

    init(network: NetworkServiceable) {
        self.network = network
    }

    func requestUserTweets(for userName: String, completion: @escaping ((Result<[TweetData], Error>) -> Void)) {
        self.fetchUser(with: userName) { (result: Result<TwitterUser, Error>) in
            switch result {
            case .success(let user):
                self.fetchTweets(userID: user.data.id, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func fetchTweets(userID: String, completion: @escaping ((Result<[TweetData], Error>) -> Void)) {
        let url = "https://\(PlistKey.twitterAPITweets.getData())\(userID))/tweets"
        let model = NetworkModel(urlString: url,
                                 headers: apiHeaders,
                                 httpMethod: .get,
                                 body: nil)
        self.network.request(model: model) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let data):
                if let tweets = self.decodeTweets(data) {
                    completion(.success(tweets.data))
                    return
                }
                completion(.failure(NetworkError.invalidJSON))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func fetchUser(with username: String, completion: @escaping ((Result<TwitterUser, Error>) -> Void)) {

        let url = "https://\(PlistKey.twitterAPIUser.getData())/\(username)"
        let model = NetworkModel(urlString: url,
                                 headers: apiHeaders,
                                 httpMethod: .get,
                                 body: nil)
        
        self.network.request(model: model) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let data):
                if let user = self.decodeUser(data) {
                    completion(.success(user))
                    return
                }
                completion(.failure(NetworkError.invalidJSON))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }

    private func decodeTweets(_ data: Data) -> Tweet? {
        do {
            let decoded = try JSONDecoder().decode(Tweet.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }

    private func decodeUser(_ data: Data) -> TwitterUser? {
        do {
            let decoded = try JSONDecoder().decode(TwitterUser.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }
}
