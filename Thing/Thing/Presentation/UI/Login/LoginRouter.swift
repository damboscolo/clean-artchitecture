//
//  LoginRouter.swift
//  Thing
//
//  Created by Daniele Boscolo on 13/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol {
    func navigateToHome()
}

struct LoginRouter: LoginRouterProtocol {
    var view: LoginViewProtocol!
    
    func navigateToHome() {
        guard let viewController = view as? UIViewController else {
            return
        }
        let nextViewController = HomeViewController.loadFromNib()
        let nav = UINavigationController(rootViewController: nextViewController)
        viewController.present(nav, animated: true)
    }
}
