//
//  CardInformationViewController.swift
//  handslag
//
//  Created by Yabaze T on 02/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents

class CardInformationViewController: UIViewController {

    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var imagePreviewBackgroundView: UIView!
    
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var cardInformation: CardInfo!
    
    var front :UIImage?
    var back :UIImage?
    var logo:UIImage?
    
    let commonFunctionalities:CommonFunctionalities = CommonFunctionalities.init()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        commonFunctionalities.blackShadow(view: topBarView)
        commonFunctionalities.blackShadow(view: previewImageView)
        commonFunctionalities.blackShadow(view: imagePreviewBackgroundView)
        // Do any additional setup after loading the view.
        
        frontImage.image = front
        backImage.image = back
        logoImage.image = logo
        
        previewImageView.image = front
        
        addGestureToImageView()
    }

    func addGestureToImageView() {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        frontImage.isUserInteractionEnabled = true
        frontImage.addGestureRecognizer(tapGestureRecognizer)
        
        let backImageGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(backImageGesture:)))
        
        backImage.isUserInteractionEnabled = true
        backImage.addGestureRecognizer(backImageGesture)
        
        let logoImageGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(logoImageGesture:)))
        
        logoImage.isUserInteractionEnabled = true
        logoImage.addGestureRecognizer(logoImageGesture)
        
    }
    
    @objc func imageTapped(backImageGesture: UITapGestureRecognizer)
    {
        
        previewImageView.image = back
        
    }
    
    @objc func imageTapped(logoImageGesture: UITapGestureRecognizer)
    {
        
        previewImageView.image = logo
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        previewImageView.image = front
    }

}
