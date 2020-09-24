//
//  LoginModuleProtocols.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation


protocol LoginViewProtocol: class {
    func updateLoginButton(isEnabled: Bool)
    func updateActivityIndicator(isSpining: Bool)
}

protocol LoginPresenterProtocol: class {
    func didChangeState(_ state: LoginScreenState)
}

protocol LoginInteractorProtocol: class {
    func didChangeUsernameField(_ username: String)
    func didChangePasswordField(_ password: String)
    func didTapLoginButton()
}
