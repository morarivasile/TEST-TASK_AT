//
//  AltarStudiosClient.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

protocol AltarStudiosAuthorizable {
    func authorize(username: String, password: String, completion: @escaping (Result<AuthResponse, APIError>) -> Void)
}

class AltarStudiosClient: APIClient {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
}

// MARK: - Authorizable

extension AltarStudiosClient: AltarStudiosAuthorizable {
    func authorize(username: String, password: String, completion: @escaping (Result<AuthResponse, APIError>) -> Void) {
        guard let request = AltarStudiosEndpoint.auth(username: username, password: password) .request else {
            assertionFailure("Failed to create URL Request")
            return
        }
        
        fetch(with: request, completion: completion)
    }
}
