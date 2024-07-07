//
//  AuthCoordinator.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class AuthCoordinator {
    var navigationController: UINavigationController
    var loginVC: LoginViewController!
    
    var userViewModel: UserViewModel
    let userService: UserService = MockUserService()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        userViewModel = UserViewModel(userService: userService)
        userViewModel.delegate = self
    }

    func start() {
        loginVC = LoginViewController(userViewModel: userViewModel)
        navigationController.setViewControllers([loginVC], animated: true)
    }
}

extension AuthCoordinator: UserViewModelDelegate {
    func didAuthenticateUser() {
        loginVC.currentState = .success
    }

    func didFailToAuthenticateUser() {
        loginVC.currentState = .failure("Authentication failed")
    }

    func didFailInput() {
        loginVC.currentState = .failure("Invalid input")
    }
}
