//
//  LoginView.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: UserViewModel?

    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // User actions
        
    @IBAction func onLoginButtonPressed(_ sender: Any) {
        guard let viewModel = viewModel else {
            print("viewModel is nil")
            return
        }
          
        viewModel.saveUser(username: usernameTextField.text, password: passwordTextField.text)
    }
    
    @IBAction func onRegisterButtonPressed(_ sender: Any) {
        
    }
}
