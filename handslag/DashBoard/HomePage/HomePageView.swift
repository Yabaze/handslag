//
//  HomePageView.swift
//  handslag
//
//  Created by Yabaze T on 29/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class HomePageView: UIView {

    @IBOutlet weak var homeView: UIView!
        
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
        
        homeView = loadViewFromNib()
        homeView.frame = bounds
        homeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        homeView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(homeView)
    }
    
    private func loadViewFromNib() -> UIView {
        return UINib(nibName: "HomePageView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView

    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "HomePageView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }


}
