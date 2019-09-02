//
//  PhotoPreviewViewController.swift
//  handslag
//
//  Created by Yabaze T on 02/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class PhotoPreviewViewController: UIViewController {

    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var previewImage: UIImageView!
    
    var front :UIImage?
    var back :UIImage?
    var logo:UIImage?
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    var cardInformationVC :CardInformationViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frontImage.image = front
        backImage.image = back
        logoImage.image = logo
        
        previewImage.image = front
        
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
        
        previewImage.image = back
    
    }
    
    @objc func imageTapped(logoImageGesture: UITapGestureRecognizer)
    {
        
        previewImage.image = logo
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        previewImage.image = front
    }
    @IBAction func redirectToCardInformationPage(_ sender: Any) {
        
        cardInformationVC =  (storyBoard.instantiateViewController(withIdentifier: "CardInformationViewController") as! CardInformationViewController)
        
        cardInformationVC?.back = back
        cardInformationVC?.front = front
        cardInformationVC?.logo = logo
        
        self.present(cardInformationVC!, animated: true, completion: nil)
        
    }
    
}
