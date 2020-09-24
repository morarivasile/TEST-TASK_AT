//
//  UserCredentials.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

struct UserCredentials {
    var username: String
    var password: String
    
    static var empty: UserCredentials {
        return UserCredentials(username: "", password: "")
    }
}
