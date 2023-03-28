//
//  Drink.swift
//  AlcoholDrinks
//
//  Created by Kirill Kniga on 27.03.2023.
//

import Foundation

let jsonUrl: URL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")!

struct Drink: Decodable {
    let drinks: [Coctail]
}

struct Coctail: Decodable {
    let strDrink: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?

    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    
    let strDrinkThumb: String?
    
    var description: String {
        """
    Ingredients & Measure:
    
        \(strIngredient1 ?? "")    \(strMeasure1 ?? "")
        \(strIngredient2 ?? "")    \(strMeasure2 ?? "")
        \(strIngredient3 ?? "")    \(strMeasure3 ?? "")
        \(strIngredient4 ?? "")    \(strMeasure4 ?? "")
        \(strIngredient5 ?? "")    \(strMeasure5 ?? "")
        \(strIngredient6 ?? "")    \(strMeasure6 ?? "")
    """
    }
}







