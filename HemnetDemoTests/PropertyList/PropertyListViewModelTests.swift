//
//  PropertyListViewModelTests.swift
//  HemnetDemoTests
//
//  Created by Sania Zafar on 15/06/2022.
//

import XCTest
@testable import HemnetDemo

class PropertyListViewModelTests: XCTestCase {
    
    var sut: PropertyListViewModel!

    override func setUp() {
        super.setUp()
        sut = PropertyListViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_fetchPropetyList_shouldSetData() throws {
        let expectation = XCTestExpectation(description: "Call fetch data")
       
        sut.fetchPropertiesForSale {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
        
        XCTAssertNotNil(sut.propertiesForSale)
        XCTAssertFalse(sut.propertiesForSale.isEmpty)
    }
}
