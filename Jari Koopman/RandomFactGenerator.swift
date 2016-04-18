//
//  RandomFactGenerator.swift
//  Jari Koopman
//
//  Created by Jari Koopman on 18/04/16.
//  Copyright © 2016 JarICT. All rights reserved.
//

import Foundation
import UIKit



class factGenerator {
    func anotherFactPressed(currentLabel: String) -> String {
        return randomFactGenerator(currentLabel)
    }
    
    
    let factsArray: [String] = [
        "I've been to Australia 3 times, when I was 3, 8 and 10, and that's where I learned most of my English.",
        "I really like reading, when I was 11 I red the whole Harry Potter series in English.",
        "I’ve got long hair, it will be made in to a wig for children with cancer.",
        "I’ve got a good sense of humor, well I think I have, opinions are divided on that…",
        "My passion for Apple started when I was 10 years old when I watched my first live event.",
        "My programming passion started only a year ago, since then I’ve created 2 apps, one of which is available for download.",
        "I’m highly gifted, because of that I’ve changed schools 4 times, I’m currently on my 2nd high school.",
        "My favourite food is pizza, but I won’t say no against fries or a good barbecue.",
        "You can wake up me for actually all Apple products, from an iPhone to an Apple Watch, I won’t complain!",
        "I’m really creative in my head, the problem occurs when I going to make something…"
    ]
    
    var chosenFact: String?
    var retrunedFact: String!

    
    func randomFactGenerator(currentFact: String) -> String {
        factGenerator()
        while chosenFact == currentFact {
            factGenerator()
        }
        
        if let factChosen = chosenFact {
            retrunedFact = factChosen
        }
        
        return retrunedFact
    }
    
    func factGenerator() {
        let arrayCount = UInt32(factsArray.count)
        let unasignedRandomNumber = arc4random_uniform(arrayCount)
        let randomNumber = Int(unasignedRandomNumber)
        
        chosenFact = factsArray[randomNumber]
        
    }


}
