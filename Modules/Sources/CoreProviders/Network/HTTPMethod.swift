//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum ConstantKeys {
    public struct APIKeys {
        public static let contentType = "Content-Type"
        public static let applicationJSON = "application/json"
    }
}
