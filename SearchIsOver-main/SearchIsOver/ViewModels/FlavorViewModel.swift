//
//  IceCreamViewModel.swift
//  SearchIsOver
//
//  Created by Vui Nguyen on 9/2/21.
//

import Foundation

// Note: Hashable is needed in order to make a Set of FlavorItem
struct FlavorItem: Identifiable, Hashable {
    var id: Int
    var name: String
    var tags: Set<FlavorFilter> 
}

class FlavorViewModel {
    let flavors: [FlavorItem] = [
        FlavorItem(id: 0, name: "Vanilla", tags: []),
        FlavorItem(id: 1, name: "Chocolate", tags: [.chocolate]),
        FlavorItem(id: 2, name: "Strawberry", tags: [.fruit]),
        FlavorItem(id: 3, name: "Blueberry", tags: [.fruit]),
        FlavorItem(id: 4, name: "Cherry Garcia", tags: [.fruit, .chocolate]),
        FlavorItem(id: 5, name: "Mint Chocolate Chip", tags: [.chocolate]),
        FlavorItem(id: 6, name: "Chocolate Covered Strawberries", tags: [.chocolate, .fruit]),
        FlavorItem(id: 7, name: "Coffee Espresso", tags: [.coffee]),
        FlavorItem(id: 8, name: "Chocolate Coffee Espresso", tags: [.chocolate, .coffee]),
        FlavorItem(id: 9, name: "Chocolate Raspberry Coffee Espresso", tags: [.coffee, .chocolate, .fruit]),
        FlavorItem(id: 10, name: "Vanilla Bean Coffee Espresso", tags: [.coffee]),
        FlavorItem(id: 11, name: "Lemoncello", tags: [.fruit]),
        FlavorItem(id: 12, name: "Salted Caramel", tags: []),
    ]
}
