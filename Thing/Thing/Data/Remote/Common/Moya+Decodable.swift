//
//  Moya+Decodable.swift
//  Thing
//
//  Created by Daniele Boscolo on 15/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Moya

public extension Moya.Response {
    public func map<T>(to type: T.Type, using decoder: JSONDecoder = JSONDecoder()) throws -> T where T: Swift.Decodable {
        return try decoder.decode(type, from: data)
    }
}
