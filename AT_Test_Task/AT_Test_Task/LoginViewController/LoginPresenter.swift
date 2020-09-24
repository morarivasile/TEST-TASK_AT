//
//  LoginPresenter.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit


final class LoginPresenter {
    
    weak var view: LoginViewProtocol?
    
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
    func credentialsChanged(_ isValid: Bool) {
        view?.updateLoginButton(isEnabled: isValid)
    }
}
