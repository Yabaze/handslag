//
//  EmailSignUpViewController.swift
//  handslag
//
//  Created by Yabaze T on 01/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents

class EmailSignUpViewController: UIViewController ,UITextFieldDelegate {

      let commonFunctionalities :CommonFunctionalities = CommonFunctionalities.init()
    
    @IBOutlet weak var emailTextInput: UITextField!
    @IBOutlet weak var agreeCheckBox: CheckBox!
    @IBOutlet weak var continueButton: MDCRaisedButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var verifyMailView: UIView!
    
    @IBOutlet weak var resendLink: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextInput {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func backPressed(_ sender: Any) {
        if(!verifyMailView.isHidden){
            verifyMailView.isHidden = true
            firstView.isHidden = false
            resendLink.isHidden = true
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBOutlet weak var topView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        verifyMailView.isHidden = true
        resendLink.isHidden = true
        
        emailTextInput.delegate = self
        
        topView.layer.cornerRadius = 30
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]

        
       agreeCheckBox.style = .tick
        
       agreeCheckBox.borderStyle = .square
        
        agreeCheckBox.addTarget(self, action: #selector(self.onCheckBoxValueChange(_:)), for: .valueChanged)

        
        commonFunctionalities.dropShadow(view: topView)
        
        commonFunctionalities.setText(button: continueButton, title: "CONTINUE")
        
        continueButton.setEnabled(false, animated: false)
        continueButton.addTarget(self, action: #selector( continueClicked), for: .touchUpInside)
        resendLink.addTarget(self, action: #selector(resendLinkClicked), for: .touchUpInside)
    }
    
    @objc func onCheckBoxValueChange(_ sender: CheckBox) {
        continueButton.setEnabled(sender.isChecked, animated: true)
    }
    
    @objc func resendLinkClicked() {
        
    }
    
    @objc func continueClicked() {
        if(verifyMailView.isHidden){
            verifyMailView.isHidden = false
            firstView.isHidden = true
            resendLink.isHidden = false
        } else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CongratulationViewController") as! CongratulationViewController
            
            nextViewController.messageText = "Your Mail Account is Verified"
            
            self.present(nextViewController, animated: true, completion: nil)
        }
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
