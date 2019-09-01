//
//  LanguageSelectionPage.swift
//  handslag
//
//  Created by Yabaze T on 31/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import MaterialComponents

class LanguageSelectionPage: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func continueClicked(_ sender: Any) {
        
        if selectedIndex != -1 {
            UserDefaults.standard.set(labelData[selectedIndex], forKey: "language")
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SlideShowViewController") as! SlideShowViewController
            self.present(nextViewController, animated:true, completion:nil)
            

        } else {
            print("Please Select Any Language")
        }
    }
    
    @IBOutlet weak var continueButton: MDCButton!
    @IBOutlet weak var topView: UIView!
    
    var labelData = ["English", "Tamil", "Hindi"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.layer.cornerRadius = 30
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setBackgroundColor(UIColor.red)
        continueButton.layer.cornerRadius = 30
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LanguageTableViewCell.self, forCellReuseIdentifier: "LanguageTableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "LanguageTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LanguageTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        cell.textLabel?.text = labelData[indexPath.row]
        let bgColorView = UIView()
        bgColorView.layer.cornerRadius = 5
        bgColorView.backgroundColor =  UIColor(red: 0.01, green: 0.01, blue: 0.01, alpha: 0.15)
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    var selectedIndex: Int = -1
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        selectedIndex = indexPath.row
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
