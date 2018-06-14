//
//  UrlRepository.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

protocol UrlDataSource {
    func getShortenerUrl(from url: String, completion: ((Result<ShortUrlModel>) -> Void))
}

struct UrlRepository {
    var remote: UrlDataSource
    
    func getShortenerUrl(from url: String, completion: ((Result<ShortUrlModel>) -> Void)) {
        remote.getShortenerUrl(from: url, completion: completion)
    }
}
