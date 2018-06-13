//
//  LoginConfigurator.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

struct LoginConfigurator {
    static let shared = LoginConfigurator()

    func configure(with viewController: LoginViewProtocol) {
        var router = LoginRouter()
        router.view = viewController
        
        var presenter = LoginPresenter()
        presenter.view = viewController
        presenter.router = router
        
        viewController.presenter = presenter
    }
}
