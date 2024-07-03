//
//  AuthCoordinator.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class AuthCoordinator {
    var navigationController: UINavigationController
    var userViewModel: UserViewModel

    init(navigationController: UINavigationController, userViewModel: UserViewModel) {
        self.navigationController = navigationController
        self.userViewModel = userViewModel
        self.userViewModel.delegate = self
    }

    func start() {
        let storyboard = UIStoryboard(name: "AuthStoryboard", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.viewModel = userViewModel
        navigationController.pushViewController(loginVC, animated: false)
    }
}

extension AuthCoordinator: UserViewModelDelegate {
    func didAuthenticateUser() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, userViewModel: userViewModel)
        homeCoordinator.start()
    }
    
    func didFailToAuthenticateUser() {
        let alertController = UIAlertController(title: "Login failed", message: "Please check your credentials", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Close", style: .default) { _ in }
        alertController.addAction(okAction)
        navigationController.present(alertController, animated: true, completion: nil)
    }
    
    func didFailInput() {
        let alertController = UIAlertController(title: "Login failed", message: "Username and password can not be empty", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Close", style: .default) { _ in }
        alertController.addAction(okAction)
        navigationController.present(alertController, animated: true, completion: nil)
    }
}
