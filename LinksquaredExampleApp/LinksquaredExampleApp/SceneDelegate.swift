//
//  SceneDelegate.swift
//  LinksquaredExampleApp
//
//  Created by Dragos Dobrean on 03.09.2024.
//

import UIKit
import Linksquared

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        Linksquared.configure(APIKey: "iostes_b26bd8b8e3554f02ad50ccd1bfec1c2df8eca18860e3ee7bf1a07f64cebd6edb", delegate: nil)
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        // Handle URL
        Linksquared.handleSceneDelegate(continue: userActivity)
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        // Handle URL
        Linksquared.handleSceneDelegate(openURLContexts: URLContexts)
    }

}

