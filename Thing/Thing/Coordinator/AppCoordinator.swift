//
//  AppCoordinator.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

struct AppCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UIViewController
    
    init(with window: UIWindow) {
        self.window = window
        
        let vc = LoginViewController.loadFromNib()
        let nav = UINavigationController(rootViewController: vc)
        self.rootViewController = nav
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
