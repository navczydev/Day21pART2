//
//  CheckboxView.swift
//  SearchIsOver
//
//  Created by Vui Nguyen on 9/2/21.
//
//  Credit for checkbox view goes to:
//  https://makeapppie.com/2019/10/16/checkboxes-in-swiftui/

import SwiftUI

struct CheckboxView: View {
    @EnvironmentObject var filterViewModel: FilterViewModel
    @State var isChecked:Bool = false
    var flavorFilter: FlavorFilter
    func toggle() {
        isChecked = !isChecked
        if flavorFilter == .none {
            filterViewModel.noneFilterSelected = isChecked
        }
        filterViewModel.checkFilter(filterToCheck: flavorFilter, isChecked: isChecked)
    }
    var body: some View {
        let noneFilterSelectedFlag = flavorFilter != .none && filterViewModel.noneFilterSelected
        Button(action: toggle){
            HStack{
                Image(systemName: (isChecked && !noneFilterSelectedFlag) ? "checkmark.square": "square")
                Text(flavorFilter.description)
            }
        }
        .disabled(noneFilterSelectedFlag)
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(isChecked: false, flavorFilter: FlavorFilter.chocolate)
            .environmentObject(FilterViewModel())
    }
}
