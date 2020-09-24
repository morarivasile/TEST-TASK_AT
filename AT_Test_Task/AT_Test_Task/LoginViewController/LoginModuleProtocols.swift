//
//  LoginModuleProtocols.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation


protocol LoginViewProtocol: class, AlertPresentable {
    func updateLoginButton(isEnabled: Bool)
    func updateActivityIndicator(isSpining: Bool)
}

protocol LoginPresenterProtocol: class {
    func fieldsDidChange(_ areFieldsValid: Bool)
    func didStartLoadingRequest()
    func didFinishRequest(result: Result<String, Error>)
}

protocol LoginInteractorProtocol: class {
    func didChangeUsernameField(_ username: String)
    func didChangePasswordField(_ password: String)
    func didTapLoginButton()
}
