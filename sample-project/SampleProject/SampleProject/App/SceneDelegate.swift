//
//  SceneDelegate.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
      
    var authCoordinator: AuthCoordinator?
    var homeCoordinator: HomeCoordinator?
    var userViewModel: UserViewModel?

    let userService: UserService = MockUserService()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
            
        let loadingViewController = LoadingViewController(nibName: "LoadingViewController", bundle: nil)
        window?.rootViewController = loadingViewController
        window?.makeKeyAndVisible()

        userViewModel = UserViewModel(userService: userService)
        userViewModel?.delegate = self
            
        userViewModel?.fetchCurrentUser()
    }

    private func startAuthCoordinator() {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        if let userViewModel = userViewModel {
            authCoordinator = AuthCoordinator(navigationController: navigationController, userViewModel: userViewModel)
            authCoordinator?.start()
        }
    }

    private func startHomeCoordinator() {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        if let userViewModel = userViewModel {
            homeCoordinator = HomeCoordinator(navigationController: navigationController, userViewModel: userViewModel)
            homeCoordinator?.start()
        }
    }
}

extension SceneDelegate: UserViewModelDelegate {
    func didFailInput() {
        startAuthCoordinator()
    }
    
    func didAuthenticateUser() {
        startHomeCoordinator()
    }
    
    func didFailToAuthenticateUser() {
        startAuthCoordinator()
    }
}
