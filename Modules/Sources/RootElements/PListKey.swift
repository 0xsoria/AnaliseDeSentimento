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

    public func getData() -> String {
        switch self {
        case .moodAPI:
            return Bundle.main.object(forInfoDictionaryKey: "MOOD_API") as? String ?? String()
        case .moodAPIKey:
            return Bundle.main.object(forInfoDictionaryKey: "MOOD_API_KEY") as? String ?? String()
        }
    }
}
