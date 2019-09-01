//
//  CongratulationViewController.swift
//  handslag
//
//  Created by Yabaze T on 01/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents

class CongratulationViewController: UIViewController {

    @IBOutlet weak var getStartedButton: MDCRaisedButton!
    var commonFunctionalities: CommonFunctionalities = CommonFunctionalities.init()
    
    @IBOutlet weak var messageLabel: UILabel!
    var messageText:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

    commonFunctionalities.setText(button: getStartedButton, title: "Let's Get Started")
        // Do any additional setup after loading the view.
        getStartedButton.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
    
    messageLabel.text = "\(messageText)"
    
    }
    
    @objc func getStarted() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GetProfileDetailViewController") as! GetProfileDetailViewController
        
        self.present(nextViewController, animated:true, completion:nil)
    }
    
}
