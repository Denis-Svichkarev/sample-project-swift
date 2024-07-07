//
//  HomeCoordinator.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class HomeCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        // TODO: Use HomeTabView
        navigationController.setViewControllers([UIViewController()], animated: true)
    }
}
