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
    var router: ShortenerRouter!

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
        router.navigateToNext()
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}
