//
//  URLSessionDataTask+Extension.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 03/06/2022.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
