//
//  LoginViewController.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak private var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak private var usernameTextField: UITextField! {
        didSet { usernameTextField.delegate = self }
    }
    
    @IBOutlet weak private var passwordTextField: UITextField! {
        didSet { passwordTextField.delegate = self }
    }
    
    @IBOutlet weak private var loginButton: UIButton!
    
    @IBOutlet weak private var centerYAnchor: NSLayoutConstraint!
    
    // MARK: - Public properties
    
    var interactor: LoginInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Авторизация"
        startObserving()
        addGestures()
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction private func didTapLoginButton(_ sender: UIButton) {
        interactor.didTapLoginButton()
    }
}

// MARK: - Private (keyboard)

extension LoginViewController {
    private func addGestures() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    private func startObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInsetForKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInsetForKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func adjustInsetForKeyboard(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        guard let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int else { return }
        
        guard let endFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] else { return }
        guard let keyboardFrame = (endFrame as? NSValue)?.cgRectValue else { return }
        
        let show = (notification.name == UIResponder.keyboardWillShowNotification) ? true : false
        let keyboardPadding: CGFloat = 10.0
        
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: [UIView.AnimationOptions(rawValue: UInt(curve))], animations: {
            if show {
                let bottomLoginButtonPoint = self.view.frame.height - self.loginButton.frame.origin.y - self.loginButton.frame.height
                if keyboardFrame.height + keyboardPadding > bottomLoginButtonPoint {
                    let difference = keyboardFrame.height - bottomLoginButtonPoint
                    self.centerYAnchor.constant -= difference + keyboardPadding
                }
            } else {
                self.centerYAnchor.constant = 0.0
            }
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
}

// MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    func updateLoginButton(isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
    }
    
    func updateActivityIndicator(isSpining: Bool) {
        if isSpining {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let previousText = NSString(string: textField.text ?? "")
        let updatedText = previousText.replacingCharacters(in: range, with: string)
        
        if textField == usernameTextField {
            interactor.didChangeUsernameField(updatedText)
        } else if textField == passwordTextField {
            interactor.didChangePasswordField(updatedText)
        }
        
        return true
    }
}
