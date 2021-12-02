//
//  TitleView.swift
//  Dike
//
//  Created by Holy-Elie Scaide on 26/11/2021.
//

import SwiftUI

struct TitleView: View {
    var title: Title
    var body: some View {
        let type = title.name.split(separator: " ")[0]
        let number = title.name.split(separator: " ")[1]
        VStack {
            Text(type)
            Spacer()
            Text(number)
                .font(.title)
            Spacer()
            Text(self.title.text)
                .lineLimit(2)
        }.padding().frame(minWidth: 10,  maxWidth: .infinity, idealHeight: 200, maxHeight: 200).background(Color("TitleBackground")).onTapGesture {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: Title(name: "Title 1", text: "Default Text", chapters: [] ))
    }
}
