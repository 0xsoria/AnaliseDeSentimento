//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 22/03/21.
//

import CoreProviders
import Foundation
import RootElements

protocol MoodNetworkable {
    func requestMoodAnalysis(moodString: String,
                             completion: @escaping ((Result<String, Errors>) -> Void))
}

final class MoodNetwork: MoodNetworkable {
    
    private let network: NetworkServiceable
    
    init(network: NetworkServiceable) {
        self.network = network
    }
    
    func requestMoodAnalysis(moodString: String, completion: @escaping ((Result<String, Errors>) -> Void)) {
        let mood = MoodAnalyzer(document: MoodDocument(type: .plainText,
                                                        language: nil,
                                                        content: moodString),
                                encodingType: .utf8)
        let moodData = try? JSONEncoder().encode(mood)
        let url = "https://\(PlistKey.moodAPI.getData())\(PlistKey.moodAPIKey.getData())"
        let model = NetworkModel(urlString: url,
                                 headers: [ConstantKeys.APIKeys.contentType: ConstantKeys.APIKeys.applicationJSON],
                                 httpMethod: .post,
                                 body: moodData)
        self.network.request(model: model) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let successData):
                if let data = self.decodeMood(successData) {
                    let mood = self.checkMood(magnitude: data.documentSentiment.magnitude,
                                   score: data.documentSentiment.score)
                    completion(.success(mood))
                    return
                }
                completion(.failure(.error))
            case .failure:
                completion(.failure(.error))
            }
        }
    }
    
    private func checkMood(magnitude: Double, score: Double) -> String {
        let mood = MoodNumbersAnalyzer(magnitude: magnitude, score: score)
        return mood.analyze()
    }

    private func decodeMood(_ data: Data) -> MoodReturn? {
        do {
            let decoded = try JSONDecoder().decode(MoodReturn.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }
}
