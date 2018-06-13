//
//  DisplayableError.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

struct AlertErrorContent {
    let title: String
    let message: String
}

enum ErrorType {
    case alert(content: AlertErrorContent)
    case toast
}

enum ErrorEffect {
    case none
    case goBack
    case dismiss
    case terminate
}

struct DisplayableError: Error {
    let type: ErrorType
    let effect: ErrorEffect
    
    init(type: ErrorType?, effect: ErrorEffect?) {
        guard let type = type, let effect = effect else {
            //Fallback to generic error
            self.type = .alert(content: AlertErrorContent(title: "Generic error", message: "Sorry"))
            self.effect = .none
            return
        }
        self.type = type
        self.effect = effect
    }
}
