//
//  ConstitutionModel.swift
//  Dike
//
//  Created by Holy-Elie Scaide on 26/11/2021.
//

import Foundation

struct Title: Codable {
    var name: String
    var text: String
    var chapters: Array<Chapter>
}

struct Chapter: Codable {
    var name: String?
    var sections: Array<TitleSection>
}

struct TitleSection: Codable {
    var name: String?
    var articles: Array<Article>
}

struct Article: Codable {
    var name: String
    var text: String
}
