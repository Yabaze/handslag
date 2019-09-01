//
//  ProfileView.swift
//  handslag
//
//  Created by Yabaze T on 30/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet weak var profileView: UIView!
    
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
        
        profileView = loadViewFromNib()
        profileView.frame = bounds
        profileView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        profileView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(profileView)
    }
    
    private func loadViewFromNib() -> UIView {
        return UINib(nibName: "ProfileView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ProfileView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }


}
