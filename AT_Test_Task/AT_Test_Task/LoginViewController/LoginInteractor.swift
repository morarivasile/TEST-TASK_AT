//
//  LoginInteractor.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

final class LoginInteractor {
    
    var presenter: LoginPresenterProtocol!
    
    private var regexValidator = RegexValidator()
    
    private var credentials = UserCredentials.empty
    
    private var areFieldsValid: Bool {
        let isEmailValid = regexValidator.validate(credentials.email, type: .email)
        let isPasswordValid = regexValidator.validate(credentials.password, type: .password)
        
        return isEmailValid && isPasswordValid
    }
    
}

// MARK: - LoginInteractorProtocol

extension LoginInteractor: LoginInteractorProtocol {
    func didChangeEmailField(_ email: String) {
        if credentials.email != email {
            credentials.email = email
            presenter.credentialsChanged(areFieldsValid)
        }
    }
    
    func didChangePasswordField(_ password: String) {
        if credentials.password != password {
            credentials.password = password
            presenter.credentialsChanged(areFieldsValid)
        }
    }
    
    func didTapLoginButton() {
        print("Login")
    }
}

struct UserCredentials {
    var email: String
    var password: String
    
    static var empty: UserCredentials {
        return UserCredentials(email: "", password: "")
    }
}
