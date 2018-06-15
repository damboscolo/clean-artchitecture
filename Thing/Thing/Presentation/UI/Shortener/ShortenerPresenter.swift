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
    var getShortenerUrlUseCase: GetShortenerUrlUseCase!
    
    func shortUrl(_ url: String) {
        view.showLoading()
        getShortenerUrlUseCase.execute(with: url) { (result) in
            self.view.hideLoading()

            switch result {
            case .success(let model):
                let viewModel = ShortenerViewModels.ShortenerViewModel(url: model.alias)
                self.view.displayShortedUrl(viewModel)
                
            case .failure(let error):
                if let genericError = self.handleGenericError(error) {
                    self.view.display(genericError)
                } else {
                    self.view.display(self.handleSpecificError(error))
                }
            }
        }
    }
}

extension ShortenerPresenter {
    func handleSpecificError(_ error: Error) -> DisplayableError {
        guard let error = error as? GetShortenerUrlError else {
            return DisplayableError() // generic error
        }
        switch error {
        case .invalidFormat:
            return DisplayableError(type: .alert(content: AlertErrorContent(title: "Error", message: "Invalid format")), effect: .none)
        }
    }
}
