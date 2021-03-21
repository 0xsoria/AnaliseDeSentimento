//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import Foundation

public enum NetworkError: Error {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

extension NetworkError: Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.responseStatusCode(let codeOne), .responseStatusCode(let codeTwo)):
            return codeOne == codeTwo
        case (.url, .url):
            return true
        case (.noResponse, .noResponse):
            return true
        case (.noData, .noData):
            return true
        case (.invalidJSON, .invalidJSON):
            return true
        case (.taskError(let erroOne), .taskError(let errorTwo)):
            return (erroOne as NSError).code == (errorTwo as NSError).code
        default:
            return false
        }
    }
}
