//
//  ShortenerPresenter.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol ShortenerPresenterProtocol {
    var view: ShortenerView! { get set }
    
    func shortUrl(_ url: String)
}

struct ShortenerPresenter: ShortenerPresenterProtocol, ErrorPresenter {    
    var view: ShortenerView!
    var router: ShortenerRouter!
    var useCase: GetShortenerUrlUseCase!
    
    func shortUrl(_ url: String) {
        let request = GetShortenerUrlUseCase.Request(url: url)
        useCase.execute(with: request, success: { (model) in
            
            let viewModel = ShortenerViewModels.ShortenerViewModel(url: model.base)
            view.displayShortedUrl(viewModel)
            
        }) { (error) in
            if let genericError = handleGenericError(error) {
                view.display(genericError)
            } else {
                view.display(handleSpecificError(error))
            }
        }
    }
}

extension ShortenerPresenter {
    func handleSpecificError(_ error: Error) -> DisplayableError {
        guard let error = error as? GetShortenerUrlError else {
            // generic error
            return DisplayableError()
        }
        switch error {
        case .invalidFormat:
            return DisplayableError(type: .alert(content: AlertErrorContent(title: "Error", message: "Invalid format")), effect: .none)
        }
    }
}
