//
//  CardController.swift
//  DeckOfCards
//
//  Created by Levi Linchenko on 03/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit
//1) Components are /
//2) Query items are [:]
//3) Extentions are .

class CardController{
    
    static let shared = CardController()
    
    //Creates a true singleton. Only one of this class
    private init() {}
    
    // https://deckofcardsapi.com/api/deck/<<deck_id>>/draw/?count=1
    
    private let baseURLString = "https://deckofcardsapi.com/api/deck"
    
     func fetchCard(count: Int, completion: @escaping ([Card]?) -> Void) {
        
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Bad base url")
        }
        
        let newURL = baseURL.appendingPathComponent("new").appendingPathComponent("draw")
        
        //Build URL
        var components = URLComponents(url: newURL, resolvingAgainstBaseURL: true)
        
        
        let queryItems = URLQueryItem(name: "count", value: "\(count)")
        
        components?.queryItems = [queryItems]
        guard let url = components?.url else {completion([]); return}
        
        print("💩 \(Thread.isMainThread)")
        //
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //1 Handle Error
            if let error = error{
                print ("There was an error fetching from dataTask \(#function) \(error)")
                return completion([])
            }
            //2 Handle Data
            guard let data = data else {print("No data returned"); completion([]); return}
            //3 Use JSONDecoder to decode your object
            let cards = try? JSONDecoder().decode(DeckDictionary.self, from: data).cards
            completion(cards)
        }.resume()
    }
    
    
    func fetchCardImage(card: Card, completion: @escaping (UIImage?)-> Void ){
        
        
        guard let url = URL(string: card.image) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            print("💋 \(Thread.isMainThread)")
            if let error = error {
                print("There was an error in \(#function) \(error) \(error.localizedDescription)")
                completion(nil)
            }
            guard let data = data,
                let image = UIImage(data: data) else {completion(nil); return}
            
            completion(image)
        }.resume()
    }
}
