//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import Foundation

public struct NetworkModel: NetworkDataModel {
    public var urlString: String
    public var headers: [String : String]?
    public var httpMethod: HTTPMethod
    public var body: Data?
    
    public init(urlString: String,
         headers: [String: String]?,
         httpMethod: HTTPMethod,
         body: Data?) {
        self.urlString = urlString
        self.headers = headers
        self.httpMethod = httpMethod
        self.body = body
    }
}
