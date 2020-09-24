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
        presenter.fieldsDidChange(areFieldsValid)
    }
    
    func didChangePasswordField(_ password: String) {
        credentials.password = password
        presenter.fieldsDidChange(areFieldsValid)
    }
    
    func didTapLoginButton() {
        presenter.didStartLoadingRequest()
        client.authorize(username: credentials.username, password: credentials.password) { (result) in
            switch result {
            case .success(let response):
                switch LoginResponseStatus(rawValue: response.status) {
                case .ok: self.presenter.didFinishRequest(result: .success(response.code))
                case .other: self.presenter.didFinishRequest(result: .failure(LoginStatusError.invalidCredentials))
                }
            case .failure(let error):
                self.presenter.didFinishRequest(result: .failure(error))
            }
        }
    }
}

enum LoginStatusError: Error {
    case invalidCredentials
}

