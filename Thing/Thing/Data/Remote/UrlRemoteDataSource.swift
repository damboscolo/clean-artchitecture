//
//  UrlRemoteDataSource.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Moya

struct UrlRemoteDataSource: UrlDataSource {
    let provider = MoyaProvider<UrlTarget>()

    func getShortenerUrl(from url: String, completion: ((Result<ShortUrlModel>) -> Void)) {
        completion(.success(ShortUrlModel(base: "daniele")))
    }
}
