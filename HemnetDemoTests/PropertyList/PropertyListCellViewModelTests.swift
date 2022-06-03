//
//  PropertyListCellViewModelTests.swift
//  HemnetDemoTests
//
//  Created by Sania Zafar on 16/06/2022.
//

import XCTest
@testable import HemnetDemo

class PropertyListCellViewModelTests: XCTestCase {
    
    var sut: PropertyListCellViewModel!

    override func setUp() {
        super.setUp()
        let property = PropertyForSale(
            type: .property,
            id: "id",
            askingPrice: 10000,
            monthlyFee: 100,
            municipality: "Heden",
            area: "Stockholm",
            daysSincePublish: 2,
            livingArea: 100,
            numberOfRooms: 2,
            streetAddress: "Test street",
            imageLink: "",
            ratingFormatted: "4/5",
            averagePrice: 10000
        )
        sut = PropertyListCellViewModel(property: property)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_askingPrice() {
        XCTAssertTrue(sut.askingPrice == "10000 SEK")
    }
    
    func test_livingArea() {
        XCTAssertTrue(sut.livingArea == "100.0 m²")
    }
    
    func test_numberOfRooms() {
        XCTAssertTrue(sut.numberOfRooms == "2 rooms")
    }
    
    func test_ratingFormatted() {
        XCTAssertTrue(sut.ratingFormatted == "Rating: 4/5")
    }
    
    func test_averagePrice() {
        XCTAssertTrue(sut.averagePrice == "Average price: 10000 SEK")
    }
}
