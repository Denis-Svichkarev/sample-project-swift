//
//  HomeCoordinator.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func toggleStateRequested()
}

class HomeCoordinator {
    var navigationController: UINavigationController
    var userViewModel: UserViewModel

    init(navigationController: UINavigationController, userViewModel: UserViewModel) {
        self.navigationController = navigationController
        self.userViewModel = userViewModel
    }

    func start() {
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let homeViewModel = HomeViewModel()
        homeVC.userViewModel = userViewModel
        homeVC.homeViewModel = homeViewModel
        homeVC.homeViewModel?.delegate = homeVC
        navigationController.pushViewController(homeVC, animated: false)
    }
}
