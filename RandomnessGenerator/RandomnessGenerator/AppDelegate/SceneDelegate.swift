//
//  SceneDelegate.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 13.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let context = DataBaseManager.viewContext
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let vc = ViewController()
        vc.context = self.context
        let nvc = NavigationVC(rootViewController: vc)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    
    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        DataBaseManager.saveContext()
    }


}

