//
//  UrlRepository.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

protocol UrlDataSource {
    func getShortUrl(from url: String, completion: @escaping ((Result<ShortUrlModel>) -> Void))
}

struct UrlRepository {
    var remote: UrlDataSource
    
    func getShortUrl(from url: String, completion: @escaping ((Result<ShortUrlModel>) -> Void)) {
        remote.getShortUrl(from: url, completion: completion)
    }
}
