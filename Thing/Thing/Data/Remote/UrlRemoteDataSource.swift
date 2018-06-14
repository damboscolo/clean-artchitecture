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

    func getShortenerUrl(from url: String, success: ((UrlModel) -> Void), error: ((Error) -> Void)) {
        success(UrlModel(base: "daniele"))
    }
}
