//
//  HTTPError.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Moya

enum DataError: Error {
    case noInternetConnection
    case timedOut
    case notFound
}

extension DataError {
    init(_ urlError: URLError) throws {
        switch urlError.code.rawValue {
        case -1001:
            self = .timedOut
        default:
            throw urlError
        }
    }
}
