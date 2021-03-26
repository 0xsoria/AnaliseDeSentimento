//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 22/03/21.
//

import Foundation

struct MoodAnalyzer: Codable {
    let document: MoodDocument
    let encodingType: EncondingType
}

struct MoodDocument: Codable {
    let type: ContentType
    let language: String?
    let content: String
}

enum ContentType: String, Codable {
    case plainText = "PLAIN_TEXT"
}

enum EncondingType: String, Codable {
    case utf8 = "UTF8"
}

enum Language: String, Codable {
    case pt = "pt"
    case en = "en"
}

struct MoodReturn: Codable {
    let documentSentiment: MoodScore
    let language: String
    let sentences: [MoodSentences]
}

struct MoodScore: Codable {
    let magnitude: Double
    let score: Double
}

struct MoodSentences: Codable {
    let text: MoodText
    let sentiment: MoodScore
}

struct MoodText: Codable {
    let content: String
    let beginOffset: Int
}

enum Errors: Error {
    case error
}
