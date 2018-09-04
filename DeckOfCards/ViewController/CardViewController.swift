//
//  CardViewController.swift
//  DeckOfCards
//
//  Created by Levi Linchenko on 03/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addVerticalGradientLayer(topColor: #colorLiteral(red: 0.08916794077, green: 0.6801530117, blue: 0.03824923692, alpha: 1), bottomColor: #colorLiteral(red: 0.8834399288, green: 0, blue: 0.08204503385, alpha: 1))
    }
    
    

    @IBAction func drawButtonTapped(_ sender: Any) {
        updateViews()
    }
    
    func updateViews(){
        CardController.shared.fetchCard(count: 1) { (cards) in
            guard let card = cards?.first else {return}
            DispatchQueue.main.async {
                self.suitLabel.text = card.suit
                self.valueLabel.text = card.value
                //            cardImageView.image = card.image
                
            }
            CardController.shared.fetchCardImage(card: card, completion: { (image) in
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                }
            })
        }
    }
    

}
