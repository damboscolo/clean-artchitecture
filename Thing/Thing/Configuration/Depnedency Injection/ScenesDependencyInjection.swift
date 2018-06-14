//
//  Swinject+Storyboard.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Swinject

struct ScenesDependencyInjection {
    static func register(with container: Container) {
        ShortenerConfigurator.configureScene(with: container)
    }
}

struct UseCaseDependencyInjection {
    static func register(with container: Container) {
        container.register(GetShortenerUrlUseCase.self) { (resolver) -> GetShortenerUrlUseCase in
            return GetShortenerUrlUseCase(repository: resolver.resolve(UrlRepository.self)!)
        }
    }
}

struct DataSourceDependencyInjection {
    static func register(with container: Container) {
        container.register(UrlRemoteDataSource.self) { (resolver) -> UrlRemoteDataSource in
            return UrlRemoteDataSource()
        }
    }
}


struct RepositoryDependencyInjection {
    static func register(with container: Container) {
        container.register(UrlRepository.self) { (resolver) -> UrlRepository in
            return UrlRepository(remote: resolver.resolve(UrlRemoteDataSource.self)!)
        }
    }
}
