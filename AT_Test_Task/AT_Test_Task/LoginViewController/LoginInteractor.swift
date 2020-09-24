//
//  LoginInteractor.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

final class LoginInteractor {
    
    var presenter: LoginPresenterProtocol!
    
    private var credentials = UserCredentials.empty
    
    private let validator: CredentialsValidator
    
    private let client: AltarStudiosAuthorizable
    
    private var areFieldsValid: Bool {
        return validator.validateUsername(credentials.username) && validator.validatePassword(credentials.password)
    }
    
    init(client: AltarStudiosClient, validator: CredentialsValidator) {
        self.client = client
        self.validator = validator
    }
    
}

// MARK: - LoginInteractorProtocol

extension LoginInteractor: LoginInteractorProtocol {
    func didChangeUsernameField(_ username: String) {
        credentials.username = username
        presenter.credentialsChanged(areFieldsValid)
    }
    
    func didChangePasswordField(_ password: String) {
        credentials.password = password
        presenter.credentialsChanged(areFieldsValid)
    }
    
    func didTapLoginButton() {
        client.authorize(username: credentials.username, password: credentials.password) { (result) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct UserCredentials {
    var username: String
    var password: String
    
    static var empty: UserCredentials {
        return UserCredentials(username: "", password: "")
    }
}
