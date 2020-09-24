//
//  LoginViewController.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak private var emailTextField: UITextField!
    
    @IBOutlet weak private var passwordTextField: UITextField!
    
    @IBOutlet weak private var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Authorization"
    }
    
    // MARK: - IBActions
    
    @IBAction private func didTapLoginButton(_ sender: UIButton) {
        
    }
    
}
