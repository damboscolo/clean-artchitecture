//
//  HTTPError.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation
import Moya

enum GenericError: Error {
    case timedOut
    case noInternetConnection
    case notFound
    case badRequest
    case internalServerError
    case unauthorized
    case forbidden
    case jsonSerialization
    case unexpected
}

extension GenericError {
    init(mapping urlError: URLError) throws {
        switch urlError.code.rawValue {
        case -1001:
            self = .timedOut
        case -1009, -1022:
            self = .noInternetConnection
        case 404:
            self = .notFound
        case 400:
            self = .badRequest
        case 500:
            self = .internalServerError
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        default:
            throw urlError
        }
    }
    
    init(mapping moyaError: MoyaError) throws {
        switch moyaError {
        case .statusCode(let response):
            switch response.statusCode {
            case -1001:
                self = .timedOut
            case -1009:
                self = .noInternetConnection
            case 404:
                self = .notFound
            case 400:
                self = .badRequest
            case 500:
                self = .internalServerError
            case 401:
                self = .unauthorized
            case 403:
                self = .forbidden
            default:
                self = .unexpected
            }
        case .underlying(let error, _):
            guard let urlError = error as? URLError else {
                self = .unexpected
                return
            }
            self = try GenericError(mapping: urlError)
        default:
            self = .unexpected
        }
    }
}

extension Error {
    func mapToGenericError() -> GenericError {
        switch self {
        case let urlError as URLError:
            guard let httpError = try? GenericError(mapping: urlError) else {
                return .unexpected
            }
            return httpError
        case let moyaError as MoyaError:
            guard let httpError = try? GenericError(mapping: moyaError) else {
                return .unexpected
            }
            return httpError
        default:
            return .unexpected
        }
    }
}
