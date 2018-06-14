//
//  GetShortenerUrlUseCase.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

struct GetShortenerUrlUseCase {
    var repository: UrlRepository
    
    func execute(with request: Request, success: (UrlModel) -> Void, error: (Error) -> Void) {
        repository.perform(from: request.url, success: { (model) in
            // do logic
        }) { (error) in
            // map error
        }
    }
}

extension GetShortenerUrlUseCase {
    struct Request {
        let url: String
    }
}
