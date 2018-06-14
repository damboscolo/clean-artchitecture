//
//  UrlRepository.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

protocol UrlDataSource {
    func getShortenerUrl(from url: String, success: ((UrlModel) -> Void), error: ((Error) -> Void))
}

struct UrlRepository {
    var remote: UrlDataSource
    
    func perform(from url: String, success: ((UrlModel) -> Void), error: ((Error) -> Void)) {
        remote.getShortenerUrl(from: url, success: success, error: error)
    }
}
