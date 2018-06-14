//
//  ShortenerViewController.swift
//  Thing
//
//  Created by Daniele Boscolo on 14/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol ShortenerView: ErrorDisplayerView {
    var presenter: ShortenerPresenter! {get set}
    func displayShortedUrl(_ viewModel: ShortenerViewModels.ShortenerViewModel)
    func showLoading()
    func hideLoading()
}

class ShortenerViewController: UIViewController, ShortenerView {

    var presenter: ShortenerPresenter!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.shortUrl("http://www.google.com")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayShortedUrl(_ viewModel: ShortenerViewModels.ShortenerViewModel) {
        // display
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}
