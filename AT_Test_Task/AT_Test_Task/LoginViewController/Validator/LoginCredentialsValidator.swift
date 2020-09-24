//
//  LoginCredentialsValidator.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

final class LoginCredentialsValidator: CredentialsValidator {
    func validateUsername(_ username: String) -> Bool {
        return username.count >= 3
    }
    
    func validatePassword(_ password: String) -> Bool {
        return password.count >= 3
    }
}
