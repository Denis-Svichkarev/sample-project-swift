//
//  InitialCoordinator.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 07.07.2024.
//

import UIKit

class InitialCoordinator {
    var navigationController: UINavigationController
   
    var userViewModel: UserViewModel
    let userService: UserService = MockUserService()
    
    var authCoordinator: AuthCoordinator?
    var homeCoordinator: HomeCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.userViewModel = UserViewModel(userService: userService)
        self.userViewModel.delegate = self
    }

    func start() {
        let loadingViewController = LoadingViewController(nibName: "LoadingViewController", bundle: nil)
        navigationController.pushViewController(loadingViewController, animated: false)
        userViewModel.fetchCurrentUser()
    }
    
    private func startAuthCoordinator() {
        authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator?.start()
    }

    private func startHomeCoordinator() {
        homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator?.start()
    }
}

extension InitialCoordinator: UserViewModelDelegate {
    func didFailInput() {}
    
    func didAuthenticateUser() {
        startHomeCoordinator()
        authCoordinator = nil
    }
    
    func didFailToAuthenticateUser() {
        startAuthCoordinator()
    }
}
