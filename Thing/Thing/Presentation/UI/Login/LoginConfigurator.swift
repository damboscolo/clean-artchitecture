//
//  LoginConfigurator.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import SwinjectStoryboard
import Swinject

struct LoginConfigurator {
    static func configure(with container: Container) {
        container.storyboardInitCompleted(LoginViewController.self) { (resolver, controller) in
            var presenter = LoginPresenter()
            let router = LoginRouter()
            
            controller.presenter = presenter
            controller.router = router
            presenter.view = controller
        }
    }
}
