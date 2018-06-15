//
//  HomePresenter.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

enum LoginError: Error {
    case invalidEmail
    case invalidPassword
}

protocol LoginPresenterProtocol {
    var view: LoginViewProtocol! {get set}

    func login()
}

struct LoginPresenter: LoginPresenterProtocol {
    var view: LoginViewProtocol!
    
    func login() {}
}
