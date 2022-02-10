//
//  FilterView.swift
//  SearchIsOver
//
//  Created by Vui Nguyen on 9/3/21.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        VStack(alignment: .leading) {
            CheckboxView(flavorFilter: FlavorFilter.fruit)
            CheckboxView(flavorFilter: FlavorFilter.chocolate)
            CheckboxView(flavorFilter: FlavorFilter.coffee)
            CheckboxView(flavorFilter: FlavorFilter.none)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView().environmentObject(FilterViewModel())
    }
}
