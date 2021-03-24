//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 24/03/21.
//

import Foundation

struct TwitterUser: Codable {
    let data: TwitterUserData
}

struct TwitterUserData: Codable {
    let id: String
    let name: String
    let username: String
}

struct Tweet: Codable {
    let data: [TweetData]
    let meta: TweetMeta
}

struct TweetData: Codable {
    let id: String
    let text: String
}

struct TweetMeta: Codable {
    let oldest_id: String
    let newest_id: String
    let result_count: Int
    let next_token: String
}
