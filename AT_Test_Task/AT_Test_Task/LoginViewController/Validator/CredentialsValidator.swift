//
//  CredentialsValidator.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

protocol CredentialsValidator {
    func validateUsername(_ username: String) -> Bool
    func validatePassword(_ password: String) -> Bool
}
