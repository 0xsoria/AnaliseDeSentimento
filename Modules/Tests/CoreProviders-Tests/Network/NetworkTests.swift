//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import XCTest
@testable import CoreProviders

final class NetworkTests: XCTestCase {

    let service = NetworkService()
    
    func test() {
        let expectation = XCTestExpectation(description: "Expect to have url error")
        let model = NetworkModel(urlString: String(),
                                 headers: nil,
                                 httpMethod: .get,
                                 body: nil)
        self.service.request(model: model) { (result: Result<Data, NetworkError>) in
            switch result {
            case .failure(let error):
                expectation.fulfill()
                XCTAssertTrue(error == .url)
            case .success:
                expectation.fulfill()
                XCTFail("Should be failure")
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testNoResponse() throws {
        let expectation = XCTestExpectation(description: "Expect to be no response")
        let bundle = Bundle.module.url(forResource: "Simple",
                                     withExtension: "json")
        let url = try XCTUnwrap(bundle).absoluteString
        let model = NetworkModel(urlString: url,
                                 headers: nil,
                                 httpMethod: .get,
                                 body: nil)
        self.service.request(model: model) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success:
                expectation.fulfill()
                XCTFail()
            case .failure(let failure):
                expectation.fulfill()
                XCTAssertTrue(failure == .noResponse)
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

