//
//  Endpoint.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

protocol Endpoint {
    var host: String { get }
    var basePath: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    var baseURLComponents: URLComponents? {
        guard var components = URLComponents(string: host) else {
            assertionFailure("Invalid HOST string: \(host)")
            return nil
        }
        components.queryItems = queryItems
        components.path = basePath
        return components
    }
    
    var request: URLRequest? {
        guard let url = baseURLComponents?.url?.appendingPathComponent(path) else {
            assertionFailure("Unable to get URL from provided base URL components!")
            return nil
        }
        return URLRequest(url: url)
    }
}
