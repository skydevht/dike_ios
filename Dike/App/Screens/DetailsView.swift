//
//  TitleView.swift
//  Dike
//
//  Created by Holy-Elie Scaide on 02/12/2021.
//

import SwiftUI

struct DetailsView: View {
    let presenter = ConstitutionPresenter()
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @State private var selectedTitle: Title?
    private func header(with header: String) -> some View {
        Text(header)
            .font(.headline)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .leading)
            .padding()
    }
    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(presenter.getTitles(), id: \.name) { title in
                            Button(title.name.split(separator: " ")[1], action: {self.selectedTitle = title})
                                .frame(width: 72, height: 72)
                                .foregroundColor(selectedTitle?.name == title.name ? Color("Text") : Color("Accent"))
                                .font(.system(size: 24, weight: .medium))
                                .background(selectedTitle?.name == title.name ? Color("Background Light") : Color.white.opacity(0) )
                        }
                    }
                }.frame(width: 72).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Background")/*@END_MENU_TOKEN@*/)
                ScrollView(showsIndicators: false) {
                    if (selectedTitle != nil) {
                            ForEach(selectedTitle!.chapters, id: \.name) { chapter in
                                ForEach (chapter.sections, id: \.name) { section in
                                    LazyVGrid(columns: columns, spacing: 10) {
                                        Section(header: header(with: chapter.name ?? "")) {
                                            ForEach(section.articles, id: \.name) { article in
                                                Button(article.name.split(separator: " ")[1], action: { print("Hash") })
                                                    .frame(width: 80, height: 80, alignment: .center)
                                                    .foregroundColor(Color.white)
                                                    .background(Color("Primary"))
                                                    .padding(0)
                                                    .font(.system(size: 24, weight: .medium))
                                            }
                                        }
                                    }.padding()
                                }
                            }
                    }
                }.frame(idealWidth: .infinity, maxWidth: .infinity).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Background Light")/*@END_MENU_TOKEN@*/)
            }.navigationBarTitle("Titres", displayMode: .inline)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
