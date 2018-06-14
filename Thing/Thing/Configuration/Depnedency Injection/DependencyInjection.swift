//
//  DependencyInjection.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        ScenesDependencyInjection.register(with: defaultContainer)
        UseCaseDependencyInjection.register(with: defaultContainer)
        DataSourceDependencyInjection.register(with: defaultContainer)
        RepositoryDependencyInjection.register(with: defaultContainer)
    }
}
