//
//  PhoneNumberSignUpViewController.swift
//  handslag
//
//  Created by Yabaze T on 01/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents

class PhoneNumberSignUpViewController: UIViewController , UITextFieldDelegate {

    let commonFunctionalities :CommonFunctionalities = CommonFunctionalities.init()
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var continueButton: MDCRaisedButton!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var phoneNumberTextInput: UITextField!
    
    @IBOutlet weak var agreeCheckBox: CheckBox!
    
    @IBOutlet weak var resendOtpButton: UIButton!
    
    @IBOutlet weak var firstDigit: UITextField!
    
    @IBOutlet weak var forthDigit: UITextField!
    
    @IBOutlet weak var thirdDigit: UITextField!
    
    @IBOutlet weak var secondDigit: UITextField!
    
    @IBOutlet weak var otpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        continueButton.setEnabled(false, animated: true)
        resendOtpButton.isHidden = true
        otpView.isHidden = true
        
        continueButton.layer.cornerRadius = 30
        
        topView.layer.cornerRadius = 30
        
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        
        phoneNumberTextInput.delegate = self

        agreeCheckBox.style = .tick
        
        agreeCheckBox.borderStyle = .square
        
        agreeCheckBox.addTarget(self, action: #selector(self.onCheckBoxValueChange(_:)), for: .valueChanged)
        
        commonFunctionalities.dropShadow(view: topView)
        
        commonFunctionalities.setText(button: continueButton, title: "CONTINUE")
        
        firstDigit.delegate = self
        secondDigit.delegate = self
        thirdDigit.delegate = self
        forthDigit.delegate = self
        
        continueButton.addTarget(self, action: #selector(continueClicked), for: .touchUpInside)
        
        firstDigit.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        secondDigit.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        thirdDigit.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        forthDigit.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        

        // Do any additional setup after loading the view.
    }
    
    @objc func continueClicked() {
        
        if CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: phoneNumberTextInput.text ?? "" )) {
            
            if(phoneNumberTextInput.text?.count ?? 0 < 10){
                print("enter 10 digits")
                return
            }
            
            
        } else {
            print("Please Enter Valid Mobile Number")
            return
        }
        
        if(otpView.isHidden){
            otpView.isHidden = false
            firstView.isHidden = true
            resendOtpButton.isHidden = false
            firstDigit.becomeFirstResponder()
        } else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CongratulationViewController") as! CongratulationViewController
            nextViewController.messageText = "Your Number is Verified"
            
            self.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        
        let text = textField.text
        
        if text?.utf16.count ?? 0 >= 1{
            switch textField{
            case firstDigit:
                secondDigit.becomeFirstResponder()
            case secondDigit:
                thirdDigit.becomeFirstResponder()
            case thirdDigit:
                forthDigit.becomeFirstResponder()
            case forthDigit:
                forthDigit.resignFirstResponder()
            default:
                break
            }
        }else{
            
        }
    }
    
    
    
    @IBAction func resendOtp(_ sender: Any) {
        
    }
    
    @objc func onCheckBoxValueChange(_ sender: CheckBox) {
        continueButton.setEnabled(sender.isChecked, animated: true)
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        if(!otpView.isHidden){
            otpView.isHidden = true
            firstView.isHidden = false
            resendOtpButton.isHidden = true
        
            phoneNumberTextInput.becomeFirstResponder()

        } else {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let text = textField.text
        
        if text?.utf16.count ?? 0 >= 1{
            switch textField{
            case firstDigit:
                secondDigit.becomeFirstResponder()
            case secondDigit:
                thirdDigit.becomeFirstResponder()
            case thirdDigit:
                forthDigit.becomeFirstResponder()
            case forthDigit:
                forthDigit.resignFirstResponder()
            default:
                break
            }
        }else{
            
        }

        return true
    }

}
