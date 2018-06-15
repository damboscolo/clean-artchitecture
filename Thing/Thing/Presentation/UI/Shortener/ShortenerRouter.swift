//
//  ShortenerRouter.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol ShortenerRouterProtocol {
    func passDataToNextScene(_ segue: UIStoryboardSegue)
    func navigateToNext()
}

struct ShortenerRouter: ShortenerRouterProtocol {
    var view: ShortenerView!
    
    let loginIdentifier = "shortenerToLogin"
    
    func navigateToNext() {
        guard let view = view as? UIViewController else { return }
        view.performSegue(withIdentifier: loginIdentifier, sender: nil)
    }
    
    func passDataToNextScene(_ segue: UIStoryboardSegue) {
        if segue.identifier == loginIdentifier {
            
        }
    }
}
