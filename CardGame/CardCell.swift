//
//  CardView.swift
//  CardGame
//
//  Created by Nurikk T. on 13.05.2023.
//

import Foundation
import UIKit

class CardCell: UICollectionViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    
    
    func configure(with emoji: String) {
        if let emojiLabel = emojiLabel {
                emojiLabel.text = emoji
            }
    }
    
    func flip() {
        
    }
}
