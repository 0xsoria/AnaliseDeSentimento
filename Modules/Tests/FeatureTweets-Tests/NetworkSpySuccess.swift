//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 24/03/21.
//

import XCTest
@testable import FeatureTweets
import CoreProviders

final class NetworkSpySuccess: NetworkServiceable {
    func request(model: NetworkDataModel, completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        if model.urlString == "https://user" {
            let encoded = """
            {"data":{"id":"012938019283","name":"name name","username":"usernamehere"}}
            """.data(using: .utf8)
            completion(.success(encoded ?? Data()))
        } else {
            let encoded = """
            {"data":[{"id":"1372251997878038532","text":"RT @MKBHD: Tell me you're insecure without telling me you're insecure https://t.co/axkB3UwFOg"},{"id":"1371851480689475598","text":"RT @Techmeme: Starting July 1, Google will drop its cut of revenue devs generate from Play Store from 30% to 15% on the first $1M earned pe…"},{"id":"1371138134562512903","text":"RT @AppStore: What's your favorite number? Ours is probably... 3.14159265358979323846264338327950288419716939937510582097494459230781640628…"},{"id":"1371137789522247690","text":"RT @neiltyson: 3.14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709…"},{"id":"1370835068671889410","text":"RT @9to5mac:  #Apple #watercooler https://t.co/MKDncS56Rd"}],"meta":{"oldest_id":"1370835068671889410","newest_id":"1374185932488728576","result_count":10,"next_token":"7140dibdnow9c7btw3w3xupn91yt4kxyp2949y7lsmqsw"}}
            """.data(using: .utf8)
            completion(.success(encoded ?? Data()))
        }
    }
}
