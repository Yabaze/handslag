//
//  OffersView.swift
//  handslag
//
//  Created by Yabaze T on 29/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import Foundation
import UIKit

class OffersView : UIView {
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "OffersViewController", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
}

