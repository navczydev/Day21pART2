//
//  SearchIsOverApp.swift
//  SearchIsOver
//
//  Created by Vui Nguyen on 9/2/21.
//

import SwiftUI

@main
struct SearchIsOverApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(FilterViewModel())
        }
    }
}
