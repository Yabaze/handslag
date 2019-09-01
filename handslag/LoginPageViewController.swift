//
//  LoginPageViewController.swift
//  handslag
//
//  Created by Yabaze T on 01/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents
import MaterialComponents.MaterialButtons_ButtonThemer


class LoginPageViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var scanImageButton: MDCFloatingButton!
    
    @IBOutlet weak var signUpWithMobileButton: MDCRaisedButton!
    
    @IBOutlet weak var signupWithEmailButton: MDCRaisedButton!
    
    let commonFunctionalities :CommonFunctionalities = CommonFunctionalities.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topView.layer.cornerRadius = 30
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        commonFunctionalities.dropShadow(view: topView)
        
        scanImageButton.setBackgroundColor(.white)
        
        scanImageButton.setTitle("+", for: .normal)
        
        scanImageButton.setTitleColor(.red, for: .normal)
        
        signUpWithMobileButton.layer.cornerRadius = 30
        signupWithEmailButton.layer.cornerRadius = 30
        
        signupWithEmailButton.addTarget(self, action: #selector(self.signUpeithEmail), for: .touchUpInside)
        
        commonFunctionalities.setText(button: signUpWithMobileButton,title: "SIGN UP WITH MOBILE NUMBER")
        signUpWithMobileButton.setTitleColor(UIColor.white, for: .normal)
        signUpWithMobileButton.addTarget(self, action: #selector(signUpWithMobileNumber), for: .touchUpInside)

        //let buttonScheme = MDCButtonScheme()
    
        //MDCOutlinedButtonThemer.applyScheme(buttonScheme, to: signupWithEmailButton)

        commonFunctionalities.setText(button: signupWithEmailButton,title: "SIGN UP WITH E-MAIL")
        signupWithEmailButton.setTitleColor(UIColor.gray, for: .normal)
        
    }
    
    @objc func signUpeithEmail() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EmailSignUpViewController") as! EmailSignUpViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @objc func signUpWithMobileNumber() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PhoneNumberSignUpViewController") as! PhoneNumberSignUpViewController
        self.present(nextViewController, animated:true, completion:nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
