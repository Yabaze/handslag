//
//  GetProfileDetailViewController.swift
//  handslag
//
//  Created by Yabaze T on 01/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents

class GetProfileDetailViewController: UIViewController{

    let commonFunctionalities:CommonFunctionalities = CommonFunctionalities.init()
    
    @IBOutlet weak var nextButton: MDCRaisedButton!
    @IBOutlet weak var name: MDCTextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var scanImage: MDCFloatingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.placeholder = "Name"
       
       commonFunctionalities.setText(button: nextButton, title: "Next")
        backgroundView.layer.borderWidth = 0.1
        backgroundView.layer.borderColor = UIColor.black.cgColor
        backgroundView.layer.cornerRadius = 30
        
        commonFunctionalities.dropShadow(view: backgroundView)
    
        scanImage.setBackgroundColor(.white)
        
        scanImage.setTitle("+", for: .normal)
        
        scanImage.setTitleColor(.red, for: .normal)
        
        scanImage.addTarget(self, action: #selector(scanImageClicked), for: .touchUpInside)
        
        
    }
    
    @objc func scanImageClicked() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CameraCaptureViewController") as! CameraCaptureViewController
        
        self.present(nextViewController, animated:true, completion:nil)
    }

}
