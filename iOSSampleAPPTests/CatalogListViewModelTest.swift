//
//  CatalogListViewModelTest.swift
//  iOSSampleAPPTests
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import XCTest
@testable import iOSSampleAPP

class CatalogListViewModelTest: XCTestCase {

    var systemUnderTest: CatalogListingViewModelProtocol!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        systemUnderTest = CatalogListingViewModel(CatalogRepository(Router<CatalogEndpoint>()))
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCatalogList() throws {
        let catalogExpectation = expectation(description: "catalog")
        
        systemUnderTest.didGetItems = { [weak self] in
            catalogExpectation.fulfill()
        }
        systemUnderTest.didFail = { [weak self] error in
            catalogExpectation.fulfill()
        }
        systemUnderTest.fetchCatalogItems()
        waitForExpectations(timeout: 60) { [weak self] (error) in
            XCTAssertNotNil(self?.systemUnderTest.itemFromIndex(0))
            XCTAssertNotNil(self?.systemUnderTest.getDetailItem(0))
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

