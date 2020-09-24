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
    
    private var state: LoginScreenState = .invalid {
        didSet {
            if state != oldValue { presenter.didChangeState(state) }
        }
    }
    
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
        
        state = areFieldsValid ? .valid : .invalid
    }
    
    func didChangePasswordField(_ password: String) {
        credentials.password = password
        
        state = areFieldsValid ? .valid : .invalid
    }
    
    func didTapLoginButton() {
        state = .loading
        client.authorize(username: credentials.username, password: credentials.password) { (result) in
            switch result {
            case .success(let response):
                self.state = response.status == "ok" ? .valid : .error
                print(response)
            case .failure(let error):
                self.state = .error
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
