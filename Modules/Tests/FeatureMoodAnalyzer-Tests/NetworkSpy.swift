//
//  File 2.swift
//  
//
//  Created by Gabriel Soria Souza on 22/03/21.
//

import Foundation
import CoreProviders

final class NetworkSpySuccess: NetworkServiceable {
    func request(model: NetworkDataModel, completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        let encoded = """
         {
           "documentSentiment": {
             "magnitude": 0.9,
             "score": 0.9
           },
           "language": "pt",
           "sentences": [
             {
               "text": {
                 "content": "estou feliz",
                 "beginOffset": 0
               },
               "sentiment": {
                 "magnitude": 0.9,
                 "score": 0.9
               }
             }
           ]
         }
        """.data(using: .utf8)
        
        completion(.success(encoded ?? Data()))
    }
}

final class NetworkSpyFailure: NetworkServiceable {
    func request(model: NetworkDataModel, completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        completion(.failure(.noData))
    }
}

final class NetworkSpySuccessButErrorData: NetworkServiceable {
    func request(model: NetworkDataModel, completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        completion(.success(Data()))
    }
}
