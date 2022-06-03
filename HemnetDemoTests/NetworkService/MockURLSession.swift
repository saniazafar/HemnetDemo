//
//  MockURLSession.swift
//  HemnetDemoTests
//
//  Created by Sania Zafar on 15/06/2022.
//

import Foundation
@testable import HemnetDemo

class MockURLSession: URLSessionProtocol {
    
    var configuration: URLSessionConfiguration = .default
    var data: Data?
    var dataTask = MockURLSessionDataTask()
    var error: Error?
    
    private(set) var url: URL?
    
    private func successURLResponse(request: URLRequest) -> URLResponse {
        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
    }
    
    func dataTask(with request: URLRequest, completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        url = request.url
        completion(data, successURLResponse(request: request), error)
        return dataTask
    }
}
