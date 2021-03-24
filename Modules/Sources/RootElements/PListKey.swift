//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import Foundation

public enum PlistKey: String {

    case moodAPI = "MOOD_API"
    case moodAPIKey = "MOOD_API_KEY"
    case twitterAPIKey = "TWITTER_API_KEY"
    case twitterAPISecretKey = "TWITTER_API_SECRET_KEY"
    case twitterBearerToken = "BEARER_TOKEN"
    case twitterAPIUser = "TWITTER_API_USER"
    case twitterAPITweets = "TWITTER_API_TWEETS"

    public func getData() -> String {
        switch self {
        case .moodAPI:
            return Bundle.main.object(forInfoDictionaryKey: "MOOD_API") as? String ?? String()
        case .moodAPIKey:
            return Bundle.main.object(forInfoDictionaryKey: "MOOD_API_KEY") as? String ?? String()
        case .twitterAPIKey:
            return Bundle.main.object(forInfoDictionaryKey: "TWITTER_API_KEY") as? String ?? String()
        case .twitterAPISecretKey:
            return Bundle.main.object(forInfoDictionaryKey: "TWITTER_API_SECRET_KEY") as? String ?? String()
        case .twitterBearerToken:
            return Bundle.main.object(forInfoDictionaryKey: "BEARER_TOKEN") as? String ?? String()
        case .twitterAPIUser:
            return Bundle.main.object(forInfoDictionaryKey: "TWITTER_API_USER") as? String ?? String()
        case .twitterAPITweets:
            return Bundle.main.object(forInfoDictionaryKey: "TWITTER_API_TWEETS") as? String ?? String()
        }
    }
}
