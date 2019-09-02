//
//  CommonFunctionalities.swift
//  handslag
//
//  Created by Yabaze T on 01/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

class CommonFunctionalities {
    
    func dropShadow(view:UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: -5, height: 5)
        view.layer.shadowRadius = 1
        //view.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    func blackShadow(view:UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: -5, height: 5)
        view.layer.shadowRadius = 1
        //view.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    func setText(button:MDCRaisedButton,title:String)  {
        
        button.setTitle(title, for: .normal)
        //button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 30
        button.titleLabel?.layer.shadowColor = UIColor.black.cgColor
        
        button.titleLabel?.layer.shadowRadius = 3.0
        button.titleLabel?.layer.shadowOpacity = 0.4
        button.titleLabel?.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.titleLabel?.layer.masksToBounds = false
    }
    
}
