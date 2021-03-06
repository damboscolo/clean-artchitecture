//
//  AppDelegate.swift
//  Thing
//
//  Created by Daniele Boscolo on 09/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(with: window)
        self.window = window
        
        appCoordinator?.start()
        
        return true
    }
}

