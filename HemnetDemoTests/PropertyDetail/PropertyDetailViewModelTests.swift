//
//  PropertyDetailViewModelTests.swift
//  HemnetDemoTests
//
//  Created by Sania Zafar on 15/06/2022.
//

import XCTest
@testable import HemnetDemo

class PropertyDetailViewModelTests: XCTestCase {
    
    var sut: PropertyDetailViewModel!

    override func setUp() {
        super.setUp()
        sut = PropertyDetailViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_fetchPropertyDetail_shouldSetData() throws {
        let expectation = XCTestExpectation(description: "Call fetch data")
       
        sut.fetchDetail {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
        
        XCTAssertNotNil(sut.propertyDetail)
    }
}
