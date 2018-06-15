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

    func getShortUrl(from url: String, completion: @escaping ((Result<ShortUrlModel>) -> Void)) {
        provider.request(.shorten(url: url)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let model = try response.map(to: ShortUrlModel.self)
                    completion(.success(model))
                } catch {
                    completion(.failure(GenericError.jsonSerialization))
                }
            case .failure(let error):
                completion(.failure(error.mapToGenericError()))
            }
        }
    }
}
