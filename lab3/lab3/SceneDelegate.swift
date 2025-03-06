//
//  SceneDelegate.swift
//  lab3
//
//  Created by Dias Yerlan on 04.03.2025.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: HeroView())
        window.makeKeyAndVisible()
        self.window = window
    }
}

