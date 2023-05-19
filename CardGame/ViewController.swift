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
    var newEmojis: [String] = []
    var emojiCount = 20
	var firstChosenEmojiCell: CardCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CardCell.nib(), forCellWithReuseIdentifier: "CardCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        shuffleEmojis()
        
    }

	@IBAction func startAgainButtonPressed(_ sender: UIButton) {
		firstChosenEmojiCell = nil
        shuffleEmojis()
		collectionView.reloadData()
	}
	@IBAction func tenButtonPressed(_ sender: UIButton) {
		emojiCount = 10
        shuffleEmojis()
		collectionView.reloadData()
	}
    @IBAction func twentyButtonPressed(_sender: UIButton) {
        emojiCount = 20
        shuffleEmojis()
        collectionView.reloadData()
    }
	
    func shuffleEmojis() {
        newEmojis = Array(repeating: "", count: emojiCount)
        
        for i in stride(from: 0, to: emojiCount, by: 2) {
            let randNum = Int.random(in: 0..<emojis.count)
            newEmojis[i] = emojis[randNum]
            newEmojis[i + 1] = emojis[randNum]
        }
        
        newEmojis.shuffle()
    }
    
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiCount
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
		
//        let randomNumer = Int.random(in: 0..<9)
//        print(randomNumer)
//        //let emoji = emojis[indexPath.item % emojis.count/2]
//		let emoji = emojis[randomNumer]
        
        let emoji = newEmojis[indexPath.item]
		
        cell.configure(with: emoji)
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
            if firstChosenEmojiCell?.emoji == cell.emoji && cell.self != firstChosenEmojiCell.self {
//				firstChosenEmojiCell?.emojiLabel.text = firstChosenEmojiCell?.emoji
//				cell.emojiLabel.text = cell.emoji
//
//				firstChosenEmojiCell?.backgroundColor = UIColor.systemGreen
//				cell.backgroundColor = UIColor.systemGreen
                
				// добавить таймер
				// сделать карточку не кликабельной, цвет белый, без рамки и без текста
                firstChosenEmojiCell?.removeFromSuperview()
                cell.removeFromSuperview()
                
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
