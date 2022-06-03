//
//  URLSession+DataTask.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 03/06/2022.
//

import Foundation

protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    
    var configuration: URLSessionConfiguration { get }
    
    func dataTask(with request: URLRequest, completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    
    func dataTask(with request: URLRequest, completion: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completion) as URLSessionDataTask
    }
}
