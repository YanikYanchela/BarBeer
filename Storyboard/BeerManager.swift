

import Foundation
import UIKit

class BeerManager {
    static let shared = BeerManager()
    var revenue: Double = 0 // Выручка
    var allBeerCount = 0
    var beers: [Beer] = []
    
    private init() {}
    
    //Метод продажи пива
    func salesBeer(beer: Beer, quantity: Double) {
        if beer.volume >= Int(quantity) {
            let totalPrice = quantity * beer.price
            revenue += totalPrice
            beer.volume -= Int(quantity)
            print("Продано \(quantity)л пива \(beer.name) за \(totalPrice)руб")
        } else {
            print("Извините, недостаточно запасов \(beer.name)")
        }
    }
    func endShift() {
        print("Выручка за смену: \(revenue)руб")
        revenue = 0
        for beer in beers {
            beer.volume = 50
        }
        
        
       
    }
}
