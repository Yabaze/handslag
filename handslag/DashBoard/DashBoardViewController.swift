//
//  ViewController.swift
//  handslag
//
//  Created by Yabaze T on 24/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomAppBar

class DashBoardViewController: UIViewController {

    @IBOutlet var bottomAppBar: MDCBottomAppBarView!
    
    let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: #selector(homeButtonClicked))
    
    let offersButton = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: #selector(offersButtonClicked))
    
    let radarButton = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: #selector(radarButtonClicked))
    
    let profileButton = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: #selector(profileButtonClicked))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appBarViewInitialization()
    }

    func appBarViewInitialization() {
        
        
    }
    
    @objc func homeButtonClicked() {
        
    }
    
    @objc func offersButtonClicked() {
        
    }
    
    @objc func radarButtonClicked() {
        
    }
    
    @objc func profileButtonClicked() {
        
    }

}

