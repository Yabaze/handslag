//
//  CardFilter.swift
//  handslag
//
//  Created by Yabaze T on 04/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class CardFilter: UIView {

    @IBOutlet weak var cardFilterLabel: UILabel!
    @IBOutlet weak var filterImageBackground: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    func nibSetup() {
    //filterImageBackground.layer.cornerRadius = 15
    }
}
