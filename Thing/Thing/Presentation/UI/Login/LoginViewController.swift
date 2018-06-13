//
//  HomeViewController.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class, ErrorDisplayer {
    var presenter: LoginPresenterProtocol! {get set}
}

class LoginViewController: UIViewController, LoginViewProtocol, Loadable {
    var presenter: LoginPresenterProtocol!
    var loadingView: FullScreenLoadingView! = FullScreenLoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        LoginConfigurator.shared.configure(with: self)
        doLogin()
    }
    
    func doLogin() {
        startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.presenter.login()
            weakSelf.stopLoading()
        }
    }
}
