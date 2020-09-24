//
//  LoginViewController.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak private var emailTextField: UITextField! {
        didSet { emailTextField.delegate = self }
    }
    
    @IBOutlet weak private var passwordTextField: UITextField! {
        didSet { passwordTextField.delegate = self }
    }
    
    @IBOutlet weak private var loginButton: UIButton!
    
    // MARK: - Public properties
    
    var interactor: LoginInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Авторизация"
    }
    
    // MARK: - IBActions
    
    @IBAction private func didTapLoginButton(_ sender: UIButton) {
        interactor.didTapLoginButton()
    }
    
}

// MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    func updateLoginButton(isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let previousText = NSString(string: textField.text ?? "")
        let updatedText = previousText.replacingCharacters(in: range, with: string)
        
        if textField == emailTextField {
            interactor.didChangeEmailField(updatedText)
        } else if textField == passwordTextField {
            interactor.didChangePasswordField(updatedText)
        }
        
        return true
    }
}
