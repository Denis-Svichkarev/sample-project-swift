//
//  LoginView.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    var userViewModel: UserViewModel?
    var cancellables = Set<AnyCancellable>()
    
    var loginStateViewController: LoginStateViewController!
    var loadingStateViewController: LoadingStateViewController!
    var failureStateViewController: FailureStateViewController!
   
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
 
        loginStateViewController.delegate = self
        failureStateViewController.delegate = self
        
        add(childViewController: loginStateViewController)
        
        bindViewModel()
    }
    
    private func bindViewModel() {
          userViewModel?.$inputError
              .sink { [weak self] hasInputError in
                  guard let self = self else { return }
                  if hasInputError {
                      self.currentState = .failure
                  }
              }
              .store(in: &cancellables)
      }
    
    private func updateViewState() {
        switch currentState {
        case .initial:
            replace(oldChildViewController: failureStateViewController, with: loginStateViewController)
        case .loading:
            replace(oldChildViewController: loginStateViewController, with: loadingStateViewController)
        case .failure:
            replace(oldChildViewController: loadingStateViewController, with: failureStateViewController)
        }
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
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

extension LoginViewController: FailureStateViewControllerDelegate {
    func tryAgainButtonPressed() {
        currentState = .initial
    }
}
