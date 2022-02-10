//
//  FilterViewModel.swift
//  SearchIsOver
//
//  Created by Vui Nguyen on 9/3/21.
//

import Foundation

protocol printEnum {
    var description: String { get }
}

enum FlavorFilter: printEnum {
    case chocolate
    case coffee
    case fruit
    case none

    var description: String {
        switch self {
        case .chocolate:
            return "Chocolate"
        case .coffee:
            return "Coffee"
        case .fruit:
            return "Fruit"
        case .none:
            return "None of the Above"
        }
    }
}

class FilterViewModel: ObservableObject {
    @Published var filteredListResults: [FlavorItem]
    @Published var noneFilterSelected = false
    let flavorViewModel = FlavorViewModel()
    var filtersSelected = Set<FlavorFilter>()

    init() {
        filteredListResults = flavorViewModel.flavors
    }

    func checkFilter(filterToCheck: FlavorFilter, isChecked: Bool) {
        if isChecked {
            filtersSelected.insert(filterToCheck)
        } else {
            filtersSelected.remove(filterToCheck)
        }
        setFilteredList()
    }

    private func setFilteredList() {
        if filtersSelected.isEmpty {
            filteredListResults = flavorViewModel.flavors
        } else {
            // set list results, which is a published entity
            // list results should be a subset of all the flavors in the flavorViewModel list that match the
            // filter criteria
            if filtersSelected.contains(.none) {
                // NOTE: "if noneFilterSelected {" would work here too,
                // but will stick with using filtersSelected for consistency
                // return flavors where the search tags are empty
                filteredListResults = flavorViewModel.flavors.filter { $0.tags == [] }
            } else {
                // return flavors where the flavor's tags are contained in the filter criteria
                filteredListResults = flavorViewModel.flavors.filter { $0.tags.isSuperset(of: filtersSelected) }
            }
        }
    }
}
