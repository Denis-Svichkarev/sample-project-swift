//
//  LoginStateViewController.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 07.07.2024.
//

import UIKit

protocol LoginStateViewControllerDelegate: AnyObject {
    func loginButtonPressed(username: String?, password: String?)
    func registerButtonPressed()
}

class LoginStateViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    private let viewModel = LoginViewModel()
    
    weak var delegate: LoginStateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = viewModel.screenTitle
        
        usernameTextField.placeholder = viewModel.usernamePlaceholder
        passwordTextField.placeholder = viewModel.passwordPlaceholder
        
        loginButton.setTitle(viewModel.loginButtonTitle, for: .normal)
        registerButton.setTitle(viewModel.registerButtonTitle, for: .normal)
    }

    @IBAction func onLoginButtonPressed(_ sender: Any) {
        delegate?.loginButtonPressed(username: usernameTextField.text, password: passwordTextField.text)
    }
      
    @IBAction func onRegisterButtonPressed(_ sender: Any) {
        delegate?.registerButtonPressed()
    }
}
