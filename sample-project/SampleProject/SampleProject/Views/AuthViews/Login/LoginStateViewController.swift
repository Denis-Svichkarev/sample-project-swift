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

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    weak var delegate: LoginStateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onLoginButtonPressed(_ sender: Any) {
        delegate?.loginButtonPressed(username: usernameTextField.text, password: passwordTextField.text)
    }
      
    @IBAction func onRegisterButtonPressed(_ sender: Any) {
        delegate?.registerButtonPressed()
    }
}
