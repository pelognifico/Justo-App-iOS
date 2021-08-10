//
//  AppDelegate.swift
//  Justo App
//
//  Created by Carlos Villamizar on 5/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.setRootViewController(UINavigationController(rootViewController: GeneralRoute.home.scene!), options: .init(direction: .toTop, style: .easeInOut))
        
        return true
    }


}

