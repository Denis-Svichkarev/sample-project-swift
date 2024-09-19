//
//  SceneDelegate.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coreCoordinator: CoreCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
    
//        self.window?.rootViewController = UINavigationController(rootViewController: TestViewController(nibName: "TestViewController", bundle: nil))
//        self.window?.makeKeyAndVisible()
        
        coreCoordinator = CoreCoordinator(window: window)
        coreCoordinator?.start()
    }
}
