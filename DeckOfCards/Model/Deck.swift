//
//  Deck.swift
//  DeckOfCards
//
//  Created by Levi Linchenko on 03/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import Foundation

struct DeckDictionary: Decodable {
    //MARK: -Property
    let cards: [Card]
    
    //Don't have to use because "cards" matches the JSON
//    private  enum CodingKeys: String, CodingKey{
//        case cards = "cards"
//    }
    
}
struct Card: Decodable{
    
    let value: String
    let suit: String
    let image: String
    
}


