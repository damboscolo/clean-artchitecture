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
    
    func execute(with url: String, completion: @escaping ((Result<ShortUrlModel>) -> Void)) {
//        if url.count > 4 {
//            completion(.failure((GetShortenerUrlError.invalidFormat)))
//            return
//        }
//        
        repository.getShortUrl(from: url, completion: completion)
    }
}

extension GetShortenerUrlUseCase {
    struct Request {
        let url: String
    }
}
