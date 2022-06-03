//
//  NetworkService.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 03/06/2022.
//

import UIKit

class NetworkService {
    
    typealias completionClosure = ( _ data: Data?, _ error: Error?) -> Void
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    private let session: URLSessionProtocol
    
    func getRequest(with url: URL, completion: @escaping completionClosure) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        task.resume()
    }
}
