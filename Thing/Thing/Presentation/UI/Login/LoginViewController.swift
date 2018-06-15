//
//  HomeViewController.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class, ErrorDisplayerView {
    var presenter: LoginPresenterProtocol! {get set}
}

class LoginViewController: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol!
    var router: LoginRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
