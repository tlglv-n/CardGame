//
//  CardCell.swift
//  CardGame
//
//  Created by Nurikk T. on 15.05.2023.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    @IBOutlet var emojiLabel: UILabel!
	var emoji: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with emoji: String) {
		self.backgroundColor = UIColor.white
        emojiLabel.text = ""
		self.emoji = emoji
    }

    static func nib() -> UINib {
        return UINib(nibName: "CardCell", bundle: nil)
    }
    
    func flip() {
		if self.backgroundColor == UIColor.white {
			self.backgroundColor = UIColor.gray
			self.emojiLabel.text = emoji
		} else if self.backgroundColor == UIColor.gray {
			self.backgroundColor = UIColor.white
			self.emojiLabel.text = ""
		}
		
    }
}
