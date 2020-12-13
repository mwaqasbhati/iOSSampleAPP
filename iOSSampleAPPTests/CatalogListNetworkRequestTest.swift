//
//  CatalogListNetworkRequestTest.swift
//  iOSSampleAPPTests
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import XCTest
@testable import iOSSampleAPP

class CatalogListNetworkRequestTest: XCTestCase {

    var systemUnderTest: CatalogEndpoint!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        systemUnderTest = CatalogEndpoint.catalog
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestInitialization() {
        XCTAssertEqual(systemUnderTest.environmentBaseURL, Constants.base_url)
        XCTAssertEqual(systemUnderTest.path, Constants.catalog_path)
        XCTAssertEqual(systemUnderTest.httpMethod, HTTPMethod.get)
        XCTAssertEqual(systemUnderTest.headers, nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

