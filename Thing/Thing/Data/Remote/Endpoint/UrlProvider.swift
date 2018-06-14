//
//  UrlProvider.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Moya

enum UrlTarget {
    case post(url: String)
}

extension UrlTarget: TargetType {
    var baseURL: URL {
        return URL(string: "http://www.google.com")!
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var method: Method {
        return .get
    }
    
    var path: String {
        return ""
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
}
