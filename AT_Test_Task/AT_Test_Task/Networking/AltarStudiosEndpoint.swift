//
//  AltarStudiosEndpoint.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

enum AltarStudiosEndpoint {
    case auth(username: String, password: String)
    case data
}

extension AltarStudiosEndpoint: Endpoint {
    var host: String {
        return "http://www.alarstudios.com"
    }
    
    var basePath: String {
        return "/test"
    }
    
    var path: String {
        switch self {
        case .auth: return "/auth.cgi"
        case .data: return "/data.cgi"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .auth(let username, let password):
            return [
                .init(name: "username", value: username),
                .init(name: "password", value: password)
            ]
        case .data:
            return nil
        }
    }
}
