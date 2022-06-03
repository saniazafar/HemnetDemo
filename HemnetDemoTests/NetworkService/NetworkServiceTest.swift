//
//  NetworkServiceTest.swift
//  HemnetDemoTests
//
//  Created by Sania Zafar on 15/06/2022.
//

import XCTest
@testable import HemnetDemo

class NetworkServiceTests: XCTestCase {
    
    var networkService: NetworkService!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        networkService = NetworkService(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
        networkService = nil
    }
    
    func test_GetRequest_WithUrl() {
        guard let url = URL(string: "https://testurl.com") else {
            fatalError("Empty Url")
        }
        networkService.getRequest(with: url) { (_, _) in }
        
        XCTAssert(session.url == url)
    }
    
    func test_GetRequest_ResumeTaskWasCalled() {
        let dataTask = MockURLSessionDataTask()
        session.dataTask = dataTask
        
        guard let url = URL(string: "https://testurl.com") else {
            fatalError("Empty Url")
        }
        
        networkService.getRequest(with: url) { (_, _) in }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_GetRequest_ShouldReturnData() {
        let expectedData = "{some test data}".data(using: .utf8)
        
        session.data = expectedData
        
        var actualData: Data?
        networkService.getRequest(with: URL(string: "https://testurl.com")!) { (data, error) in
            actualData = data
        }
        
        XCTAssertNotNil(actualData)
    }
}
