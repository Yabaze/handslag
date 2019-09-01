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
    @IBOutlet weak var homeView: HomePageView!
    @IBOutlet weak var offersView: OffersView!
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var radarView: RadarPageView!
    
    let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: #selector(homeButtonClicked))
    
    let offersButton = UIBarButtonItem(title: "Offers", style: .plain, target: nil, action: #selector(offersButtonClicked))
    
    let radarButton = UIBarButtonItem(title: "Radar", style: .plain, target: nil, action: #selector(radarButtonClicked))
    
    let profileButton = UIBarButtonItem(title: "Profile", style: .plain, target: nil, action: #selector(profileButtonClicked))
    
    var cameraFloatingButton : MDCFloatingButton {
        let fab = MDCFloatingButton()
        fab.setTitle("+", for: .normal)
        fab.setBackgroundColor(.white)
        return fab
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appBarViewInitialization()
        
        bottomBarSelection(homeSelected: false,offerSelected: true,radarSelected: true,profileSelected: true)
    }
    
    func bottomBarSelection(homeSelected:Bool,offerSelected:Bool,radarSelected:Bool,profileSelected:Bool) {
        
        homeView.isHidden = homeSelected
        profileView.isHidden = offerSelected
        radarView.isHidden = radarSelected
        offersView.isHidden = profileSelected
        
    }

    func appBarViewInitialization() {
        
        bottomAppBar.trailingBarButtonItems = [profileButton,radarButton]
        bottomAppBar.leadingBarButtonItems = [homeButton,offersButton]
        
        bottomAppBar.floatingButton.setBackgroundColor(.white)
        
        bottomAppBar.floatingButton.setTitle("+", for: .normal)
        
        bottomAppBar.floatingButton.setTitleColor(.red, for: .normal)
        
    }

    
    @objc func homeButtonClicked() {
        
        bottomBarSelection(homeSelected: false,offerSelected: true,radarSelected: true,profileSelected: true)
        
    }

    @objc func offersButtonClicked() {
        bottomBarSelection(homeSelected: true,offerSelected: false,radarSelected: true,profileSelected: true)

    }
    
    @objc func radarButtonClicked() {
       bottomBarSelection(homeSelected: true,offerSelected: true,radarSelected: false,profileSelected: true)

    }
    
    @objc func profileButtonClicked() {
        bottomBarSelection(homeSelected: true,offerSelected: true,radarSelected: true,profileSelected: false)

    }

}
