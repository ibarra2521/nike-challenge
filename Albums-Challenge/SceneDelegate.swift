//
//  SceneDelegate.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let home = HomeViewController()
        home.view.backgroundColor = .yellow
        let navigationController = UINavigationController(rootViewController: home)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

