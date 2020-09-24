//
//  LoginModuleProtocols.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation


protocol LoginViewProtocol: class {
    func updateLoginButton(isEnabled: Bool)
}

protocol LoginPresenterProtocol: class {
    func credentialsChanged(_ isValid: Bool)
}

protocol LoginInteractorProtocol: class {
    func didChangeEmailField(_ email: String)
    func didChangePasswordField(_ password: String)
    func didTapLoginButton()
}
