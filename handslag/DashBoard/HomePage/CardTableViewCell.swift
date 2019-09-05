//
//  CardTableViewCell.swift
//  handslag
//
//  Created by Yabaze T on 04/09/19.
//  Copyright © 2019 Yabaze T. All rights reserved.
//

import UIKit
import Cosmos

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var callImageView: UIImageView!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var chatImageView: UIImageView!
    
    @IBOutlet weak var isFavourite: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
