//
//  ErrorDisplayer.swift
//  Thing
//
//  Created by Daniele Boscolo on 13/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol ErrorDisplayerView {
    func display(_ displayableError: DisplayableError)
}

extension ErrorDisplayerView where Self: UIViewController {
    func display(_ displayableError: DisplayableError) {
        let alertActionHandler: ((UIAlertAction?) -> Void) = { _ in
            switch displayableError.effect {
            case .none:
                break
            case .goBack:
                self.navigationController?.popViewController(animated: true)
            case .dismiss:
                self.dismiss(animated: true, completion: nil)
            case .terminate:
                UIApplication.shared.keyWindow?.rootViewController?.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        switch displayableError.type {
        case .alert(let content):
            let alert = UIAlertController(title: content.title, message: content.message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: alertActionHandler)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        case .toast:
            break
        case .silent:
            break
        }
    }
}
