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
