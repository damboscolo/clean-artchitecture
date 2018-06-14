//
//  ErroHandlerPresenter.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Foundation

protocol ErrorPresenter {
    func handleGenericError(_ error: Error) -> DisplayableError?
}

extension ErrorPresenter {
    func handleGenericError(_ error: Error) -> DisplayableError? {
        if let error = error as? DataError {
            switch error {
            case .noInternetConnection:
                return DisplayableError(type: .alert(content:
                    AlertErrorContent(title: "Internet connection problem",
                                      message: "Verify your internet connection and try again later")),
                                        effect: .none)
            case .timedOut:
                return DisplayableError(type: .alert(content:
                    AlertErrorContent(title: "Timed out",
                                      message: "")),
                                        effect: .none)
            default:
                // Fallback to generic error
                return DisplayableError()
            }
        }
        // Non generic error
        return nil
    }
}
