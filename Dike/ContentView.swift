//
//  ContentView.swift
//  Dike
//
//  Created by Holy-Elie Scaide on 26/11/2021.
//

import SwiftUI

struct ContentView: View {
    var presenter = ConstitutionPresenter()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
            NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(presenter.getTitle(), id: \.name) { title in
                        TitleView(title: title)
                    }
                }
            }.navigationTitle("Dike")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
