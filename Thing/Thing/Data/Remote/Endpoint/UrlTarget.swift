//
//  UrlProvider.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Moya

enum UrlTarget {
    case shorten(url: String)
}

extension UrlTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2/")!
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var method: Method {
        switch self {
        case .shorten:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .shorten:
            return "api/alias"
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .shorten(let url):
            return .requestParameters(parameters: ["url": url], encoding: JSONDictionaryEncoding.default)
        }
    }
}
