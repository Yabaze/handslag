//
//  HomePageView.swift
//  handslag
//
//  Created by Yabaze T on 29/08/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit

class HomePageView: UIView ,UIScrollViewDelegate ,UITableViewDelegate ,UITableViewDataSource {
    
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

        return cell
    }
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("You tapped cell number \(indexPath.row).")
       }

       // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

           if editingStyle == .delete {

               // remove the item from the data model
               //animals.remove(at: indexPath.row)

               // delete the table view row
               tableView.deleteRows(at: [indexPath], with: .fade)

           } else if editingStyle == .insert {
               
            
           }
       }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        // action one
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            print("Edit tapped")
        })
        editAction.backgroundColor = UIColor.blue

        // action two
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            print("Delete tapped")
        })
        deleteAction.backgroundColor = UIColor.red

        return [editAction, deleteAction]
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
