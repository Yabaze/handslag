//
//  CardInfo.swift
//  handslag
//
//  Created by Yabaze T on 02/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class CardInfo: UIView {

    @IBOutlet weak var cardInfoView: UIView!
    
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
        
        cardInfoView = loadViewFromNib()
        cardInfoView.frame = bounds
        cardInfoView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cardInfoView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(cardInfoView)
    }
    
    private func loadViewFromNib() -> UIView {
        return UINib(nibName: "CardInfo", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CardInfo", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }

}
