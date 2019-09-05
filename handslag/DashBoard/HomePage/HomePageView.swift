//
//  HomePageView.swift
//  handslag
//
//  Created by Yabaze T on 29/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class HomePageView: UIView ,UIScrollViewDelegate ,UITableViewDelegate ,UITableViewDataSource ,UITextFieldDelegate  {
    
    @IBOutlet weak var searchTextFiled: UITextField!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var rootScrollView: UIScrollView!{
        didSet{
            rootScrollView.delegate = self
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            //tableView.alwaysBounceVertical = true
            //tableView.isScrollEnabled = false
        }
        
    }
    
    @IBOutlet weak var cardFilterScrollView: UIScrollView!{
        didSet{
            cardFilterScrollView.delegate = self
        }
        
    }
    
    var cards:[CardFilter] = [];
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        
        homeView = loadViewFromNib()
        homeView.frame = bounds
        homeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        homeView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(homeView)
        
        cards = createCards()
        setupCardScrollView(cards: cards)
        
        tableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "CardTableViewCell")
        
        cardFilterScrollView.isHidden = true
        searchTextFiled.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchTextFiled {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func filterClicked(_ sender: Any) {
        
        cardFilterScrollView.isHidden = !cardFilterScrollView.isHidden
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: 10 * 270)
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "CardTableViewCell"
        
        var cell: CardTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CardTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "CardTableViewCell")
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CardTableViewCell
            
        }
        
        cell.cardImageView.layer.cornerRadius = 15
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(            favouriteTapped(favouriteImageGesture:)))
        
        cell.isFavourite.isUserInteractionEnabled = true
        
        cell.isFavourite.addGestureRecognizer(tapGestureRecognizer)

        return cell
    }
    
    @objc func favouriteTapped(favouriteImageGesture: UITapGestureRecognizer)
    {
        print("cool")
    }
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("You tapped cell number \(indexPath.row).")
       }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let closeAction = UIContextualAction(style: .normal, title:  "Send", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("Card Send Successfully")
                success(true)
            })
            closeAction.image = UIImage(named: "Edit")
            closeAction.backgroundColor = .purple
    
            return UISwipeActionsConfiguration(actions: [closeAction])
    
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let email = UIContextualAction(style: .normal, title:  "Email", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Email")
            success(true)
        })
        email.image = UIImage(named: "Edit")
        email.backgroundColor = .blue
    
        let chat = UIContextualAction(style: .normal, title:  nil, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Chat")
            success(true)
        })
        chat.image = UIImage(named: "Edit")
        chat.backgroundColor = UIColor.green
        
        
        let message = UIContextualAction(style: .normal, title:  nil, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                   print("message")
                   success(true)
               })
        message.image = UIImage(named: "Edit")
               message.backgroundColor = UIColor.blue
        
        let offers = UIContextualAction(style: .normal, title:  nil, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                   print("offers")
                   success(true)
               })
               //rename.backgroundColor = UIColor(patternImage: UIImage(named: "Edit")!)
               offers.backgroundColor = UIColor.green
        offers.image = UIImage(named: "Edit")
        return UISwipeActionsConfiguration(actions: [email,chat,message,offers])
    }
    
    
    
    
    
    
    

    func createCards() -> [CardFilter]{
        
        let card1:CardFilter = Bundle.main.loadNibNamed("CardFilter", owner: self, options: nil)?.first as! CardFilter
        card1.cardFilterLabel.text = "Business"
        card1.filterImageBackground.layer.cornerRadius = 15
        
        
        let card2:CardFilter = Bundle.main.loadNibNamed("CardFilter", owner: self, options: nil)?.first as! CardFilter
        card2.cardFilterLabel.text = "Family"
        card2.self.layer.backgroundColor = UIColor.yellow.cgColor
        card2.filterImageBackground.layer.cornerRadius = 15
        
        let card3:CardFilter = Bundle.main.loadNibNamed("CardFilter", owner: self, options: nil)?.first as! CardFilter
        card3.cardFilterLabel.text = "Favourite"
        card3.filterImageBackground.layer.cornerRadius = 15
        
        return [card1,card2,card3]
        
    }
    
    func setupCardScrollView(cards:[CardFilter])  {
        cardFilterScrollView.frame = CGRect(x: 0, y: 0, width: 300, height: 160)
        cardFilterScrollView.contentSize = CGSize(width: 300 * CGFloat(cards.count), height: 160)
        //cardFilterScrollView.isPagingEnabled = true
        
        for i in 0 ..< cards.count {
            cards[i].frame = CGRect(x: 300 * CGFloat(i), y: 0, width: 300, height: 160)
            cardFilterScrollView.addSubview(cards[i])
        }
    }
    
    private func loadViewFromNib() -> UIView {
        return UINib(nibName: "HomePageView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView

    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "HomePageView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }


}
