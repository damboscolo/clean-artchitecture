//
//  ShortenerRouter.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol ShortenerRouterProtocol {
    func navigateToNext()
}

struct ShortenerRouter: ShortenerRouterProtocol {
    var view: ShortenerView!
    
    func navigateToNext() {
        guard let view = view as? UIViewController else { return }
        view.performSegue(withIdentifier: "shortenerToLogin", sender: nil)
    }
}
