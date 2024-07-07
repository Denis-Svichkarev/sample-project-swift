//
//  SceneDelegate.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    var initialCoordinator: InitialCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        initialCoordinator = InitialCoordinator(navigationController: UINavigationController())
        initialCoordinator?.start()
        
        window?.rootViewController = initialCoordinator?.navigationController
        window?.makeKeyAndVisible()
    }
}
