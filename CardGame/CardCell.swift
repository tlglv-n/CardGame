//
//  CardCell.swift
//  CardGame
//
//  Created by Nurikk T. on 15.05.2023.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    @IBOutlet var emojiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with emoji: String) {
        emojiLabel.text = emoji
    }

    static func nib() -> UINib {
        return UINib(nibName: "CardCell", bundle: nil)
    }
    
    func flip() {
        
    }
}
