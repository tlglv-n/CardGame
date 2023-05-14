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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiCount
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        let emoji = emojis[indexPath.item % emojis.count]
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
        cell.flip()
        // TODO: Check if selected card matches with another selected card
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        cell.backgroundColor = .white
//    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 70
        let height: CGFloat = 110
        return CGSize(width: width, height: height)
    }
}
