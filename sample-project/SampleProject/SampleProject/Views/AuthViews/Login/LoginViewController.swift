//
//  LoginView.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class LoginViewController: UIViewController {
    var userViewModel: UserViewModel?
   
    var loginStateViewController: LoginStateViewController!
    var loadingStateViewController: LoadingStateViewController!
    var failureStateViewController: FailureStateViewController!
    var successStateViewController: SuccessStateViewController!
    
    var currentState: LoginState = .initial {
        didSet {
            updateViewState()
        }
    }
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
        
        loginStateViewController = storyboard.instantiateViewController(withIdentifier: "LoginStateViewController") as? LoginStateViewController
        loadingStateViewController = storyboard.instantiateViewController(withIdentifier: "LoadingStateViewController") as? LoadingStateViewController
        failureStateViewController = storyboard.instantiateViewController(withIdentifier: "FailureStateViewController") as? FailureStateViewController
        successStateViewController = storyboard.instantiateViewController(withIdentifier: "SuccessStateViewController") as? SuccessStateViewController
        
        loginStateViewController.delegate = self
        
        add(childViewController: loginStateViewController)
    }
    
    private func updateViewState() {
        switch currentState {
        case .initial:
            replace(oldChildViewController: failureStateViewController, with: loginStateViewController)
        case .loading:
            replace(oldChildViewController: loginStateViewController, with: loadingStateViewController)
        case .success:
            replace(oldChildViewController: loadingStateViewController, with: successStateViewController)
        case .failure(_):
            replace(oldChildViewController: loadingStateViewController, with: failureStateViewController)
        }
    }
}

extension LoginViewController: LoginStateViewControllerDelegate {
    func loginButtonPressed(username: String?, password: String?) {  
        currentState = .loading
        userViewModel?.saveUser(username: username, password: password)
    }
    
    func registerButtonPressed() {
        
    }
}
