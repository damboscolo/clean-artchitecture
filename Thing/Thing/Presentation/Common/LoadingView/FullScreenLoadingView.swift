//
//  LoadingView.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit
import SnapKit

class FullScreenLoadingView: UIView, LoadingView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        activityIndicator.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
