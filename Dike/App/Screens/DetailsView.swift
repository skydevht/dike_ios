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
    }
    var body: some View {
        NavigationView {
            HStack {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(presenter.getTitles(), id: \.name) { title in
                            Button(title.name.split(separator: " ")[1], action: {self.selectedTitle = title})
                                .frame(width: 60.0, height: 60.0)
                                .foregroundColor(Color("Dark"))
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Light")/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 24, weight: .medium))
                        }
                    }
                }.frame(width: 72)
                ScrollView {
                    if (selectedTitle != nil) {
                            ForEach(selectedTitle!.chapters, id: \.name) { chapter in
                                ForEach (chapter.sections, id: \.name) { section in
                                    LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                                        Section(header: header(with: chapter.name ?? "")) {
                                            ForEach(section.articles, id: \.name) { article in
                                                Text(article.name)
                                            }
                                        }
                                    }
                                }
                            }
                    }
                }.frame(idealWidth: .infinity, maxWidth: .infinity)
            }.navigationBarTitle("Titres", displayMode: .inline)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
