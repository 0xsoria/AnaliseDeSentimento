//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import Foundation

public class NetworkService: NetworkServiceable {
    
    private var configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20.0
        return config
    }()
    
    private var session: URLSession {
        return URLSession(configuration: self.configuration)
    }
    
    public init() {}
    
    public func request(model: NetworkDataModel, completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        guard let safeURL = URL(string: model.urlString) else {
            completion(.failure(.url))
            return
        }
        
        let request = self.defineURLRequest(url: safeURL, dataModel: model)
        
        let dataTask = self.session.dataTask(with: request) { (data, response, error) in
            self.response(completion: completion)(data, response, error)
        }
        dataTask.resume()
    }
    
    private func defineURLRequest(url: URL, dataModel: NetworkDataModel) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = dataModel.body
        urlRequest.httpMethod = dataModel.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = dataModel.headers
        return urlRequest
    }
    
    private func response(completion: @escaping (Result<Data, NetworkError>) -> Void) -> ((Data?, URLResponse?, Error?) -> Void) {
        return { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(.noResponse))
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.success(data))
                    
                } else {
                    completion(.failure(.responseStatusCode(code: response.statusCode)))
                }
            } else {
                completion(.failure(.taskError(error: error!)))
            }
        }
    }
}

