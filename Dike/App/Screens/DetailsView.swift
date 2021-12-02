//
//  TitleView.swift
//  Dike
//
//  Created by Holy-Elie Scaide on 02/12/2021.
//

import SwiftUI

struct DetailsView: View {
    let presenter = ConstitutionPresenter()
    
    func onTitleClick() -> Void {
        
    }
    var body: some View {
        NavigationView {
            HStack {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(presenter.getTitles(), id: \.name) { title in
                            Button(title.name.split(separator: " ")[1], action: onTitleClick)
                                .frame(width: 60.0, height: 60.0)
                                .foregroundColor(Color("Dark"))
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Light")/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 24, weight: .medium))
                        }
                    }
                }.frame(width: 72)
                Spacer()
            }.navigationBarTitle("Titres", displayMode: .inline)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
