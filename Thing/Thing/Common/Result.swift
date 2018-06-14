//
//  Result.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
