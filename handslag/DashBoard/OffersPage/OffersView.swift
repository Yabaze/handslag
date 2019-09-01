//
//  OffersView.swift
//  handslag
//
//  Created by Yabaze T on 30/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class OffersView: UIView {

    @IBOutlet weak var offerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        
        offerView = loadViewFromNib()
        offerView.frame = bounds
        offerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        offerView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(offerView)
    }
    
    private func loadViewFromNib() -> UIView {
        return UINib(nibName: "OffersView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "OffersView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }

}
