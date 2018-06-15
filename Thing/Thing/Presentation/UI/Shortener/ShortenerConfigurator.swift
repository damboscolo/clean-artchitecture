//
//  ShortenerConfigurator.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

struct ShortenerConfigurator {
    static func configureScene(with container: Container) {
        container.storyboardInitCompleted(ShortenerViewController.self) { (resolver, controller) in
            var presenter = ShortenerPresenter()
            var router = ShortenerRouter()
            
            router.view = controller
            controller.router = router
            presenter.view = controller
            presenter.getShortenerUrlUseCase = resolver.resolve(GetShortenerUrlUseCase.self)
            controller.presenter = presenter
        }
    }
}
