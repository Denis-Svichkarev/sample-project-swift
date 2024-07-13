//
//  AuthCoordinator.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class AuthCoordinator: Coordinator {
    var window: UIWindow
    var userViewModel: UserViewModel
    var loginVC: LoginViewController!

    let userService: UserService = MockUserService()
    
    init(window: UIWindow, userViewModel: UserViewModel) {
        self.window = window
        self.userViewModel = userViewModel
    }

    override func start() {
        loginVC = LoginViewController(userViewModel: userViewModel)
        self.window.rootViewController = UINavigationController(rootViewController: loginVC)
    }
}
