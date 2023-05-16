//
//  ViewController.swift
//  CardGame
//
//  Created by Nurikk T. on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    var emojis = ["🚜", "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🛴", "🚲", "🛵", "🏍", "🛺", "✈️", "🚀", "🛳", "⛵️", "🛸", "🚁"]
    var emojiCount = 20
	var firstChosenEmojiCell: CardCell?
	//var secondChosenEmojiCell: CardCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        
        collectionView.register(CardCell.nib(), forCellWithReuseIdentifier: "CardCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 70, height: 110)
//        collectionView.collectionViewLayout = layout
    }

	@IBAction func startAgainButtonPressed(_ sender: UIButton) {
		firstChosenEmojiCell = nil
		collectionView.reloadData()
	}
	
    
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiCount
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        let emoji = emojis[indexPath.item % emojis.count/2]
		print(indexPath.item % emojis.count)
        cell.configure(with: emoji)
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 20
        
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCell
		
		if firstChosenEmojiCell == nil {
			firstChosenEmojiCell = cell
			cell.flip()
			return
		} else if firstChosenEmojiCell != nil {
			if firstChosenEmojiCell?.emoji == cell.emoji {
				firstChosenEmojiCell?.emojiLabel.text = firstChosenEmojiCell?.emoji
				cell.emojiLabel.text = cell.emoji
				
				firstChosenEmojiCell?.backgroundColor = UIColor.systemGreen
				cell.backgroundColor = UIColor.systemGreen
				
				firstChosenEmojiCell = nil
			} else {
				firstChosenEmojiCell?.flip()
				
				firstChosenEmojiCell = cell
				cell.flip()
			}
		}
		
		
		
		print(firstChosenEmojiCell?.emojiLabel)
		
		// we have 2 chosen cards
		// if i click 1 card - i set first chosen emoji
		// if i click 2 card - i set second chosen emoji
		// if i click 3 card - set first chosen emoji
		// if i click 4 card - set second chosen emoji
		
        //cell.flip()
        // TODO: Check if selected card matches with another selected card
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        cell.backgroundColor = .white
//    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 70)
    }
}
