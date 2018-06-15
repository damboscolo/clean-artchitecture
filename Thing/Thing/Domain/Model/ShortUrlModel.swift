//
//  UrlModel.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

struct ShortUrlModel: Decodable {
    let alias: String
    let link: LinkModel
    
    enum ShortUrlKeys: String, CodingKey {
        case alias = "alias"
        case link = "_link"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ShortUrlKeys.self)
        
        alias = try container.decode(String.self, forKey: .alias)
        link = try container.decode(LinkModel.self, forKey: .link)
    }
}

struct LinkModel: Decodable {
    let value: String
    
    enum LinkKeys: String, CodingKey {
        case value = "self"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LinkKeys.self)
        value = try container.decode(String.self, forKey: .value)
    }
}
