//
//  EmojiTableViewCell.swift
//  Emoji
//
//  Created by Ayça Işık on 8.01.2023.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    //MARK: - UIElements

    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var descriptionLabel : UILabel!
    
    //MARK: - Functions
    
    func update(with emoji : Emoji){
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
        
    }
    

    
    
    

}
