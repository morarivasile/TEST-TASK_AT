//
//  LoginPresenter.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit


final class LoginPresenter {
    
    weak var view: LoginViewProtocol?
    
    
    private func presentError(title: String, subtitle: String) {
        view?.presentAlert(with: title, subtitle: subtitle, actions: [
            UIAlertAction(title: "OK", style: .cancel, handler: nil)
        ])
    }
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
    func fieldsDidChange(_ areFieldsValid: Bool) {
        view?.updateLoginButton(isEnabled: areFieldsValid)
    }
    
    func didStartLoadingRequest() {
        view?.updateActivityIndicator(isSpining: true)
    }
    
    func didFinishRequest(result: Result<String, Error>) {
        view?.updateActivityIndicator(isSpining: false)
        
        switch result {
        case .success(let code):
            
            view?.presentAlert(with: "HURRAY", subtitle: code, actions: [
                UIAlertAction(title: "OK", style: .cancel, handler: nil)
            ])
            
        case .failure(let error):
            if let error = error as? APIError {
                presentError(title: "Oops...", subtitle: "Something went wrong.")
                debugPrint(error.localizedDescription)
            } else if let error = error as? LoginStatusError, error == .invalidCredentials {
                presentError(title: "Hmm...", subtitle: "Invalid credentials. Try again!")
            }
        }
    }
}
