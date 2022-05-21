//
//  Cocktail.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import Foundation
import UIKit

struct drinksResponse: Codable{
    let response: [drinks]
}

struct drinks: Codable{
    let strDrink: String
    let strDrinkThumb: String
    let strCategory: String
    let strGlass: String
}
