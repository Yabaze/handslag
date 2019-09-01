//
//  RadarPageView.swift
//  handslag
//
//  Created by Yabaze T on 30/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class RadarPageView: UIView {

    @IBOutlet weak var radarView: UIView!
    
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
        
        radarView = loadViewFromNib()
        radarView.frame = bounds
        radarView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        radarView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(radarView)
    }
    
    private func loadViewFromNib() -> UIView {
        return UINib(nibName: "RadarPageView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "RadarPageView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }


}
