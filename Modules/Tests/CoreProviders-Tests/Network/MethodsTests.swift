//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 21/03/21.
//

import XCTest
@testable import CoreProviders

final class MethodsTests: XCTestCase {
    func testMethod() {
        XCTAssertTrue(HTTPMethod.get.rawValue == "GET")
        XCTAssertTrue(HTTPMethod.post.rawValue == "POST")
    }
}
