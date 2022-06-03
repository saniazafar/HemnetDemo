//
//  MockURLSessionDataTask.swift
//  HemnetDemoTests
//
//  Created by Sania Zafar on 15/06/2022.
//

@testable import HemnetDemo

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private(set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}
