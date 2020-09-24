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
    func didChangeState(_ state: LoginScreenState) {
        print(state)
        
        switch state {
        case .invalid:
            view?.updateLoginButton(isEnabled: false)
        case .valid:
            view?.updateLoginButton(isEnabled: true)
            view?.updateActivityIndicator(isSpining: false)
        case .loading:
            view?.updateLoginButton(isEnabled: false)
            view?.updateActivityIndicator(isSpining: true)
        case .error:
            view?.updateActivityIndicator(isSpining: false)
        }
    }
}
