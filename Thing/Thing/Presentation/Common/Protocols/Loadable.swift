//
//  FullScreenLoadable.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit
import SnapKit

protocol LoadingView {}

protocol Loadable {
    associatedtype LoadableView: UIView & LoadingView
    
    var loadingView: LoadableView! {get set}
    
    func startLoading()
    func stopLoading()
}

extension Loadable where Self: UIViewController {
    func startLoading() {
        if !view.subviews.contains(loadingView) {
            view.addSubview(loadingView)
            loadingView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
        loadingView.isHidden = false
        view.bringSubview(toFront: loadingView)
        loadingView.setNeedsUpdateConstraints()
    }
    
    func stopLoading() {
        loadingView.isHidden = true
        loadingView.setNeedsUpdateConstraints()
    }
}

