//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import Foundation

public protocol NetworkServiceable {
    func request(model: NetworkDataModel, completion: @escaping ((Result<Data, NetworkError>) -> Void))
}
