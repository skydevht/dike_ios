//
//  ConstitutionPresenter.swift
//  Dike
//
//  Created by Holy-Elie Scaide on 26/11/2021.
//


import Foundation
import Yams

struct ConstitutionPresenter {
    var titles: [Title] = []
    init() {
        if let filepath = Bundle.main.url(forResource: "const-1987-amd", withExtension: "yml") {
            if let fileContent = try? String(contentsOf: filepath) {
                do {
                    let decoder = YAMLDecoder()
                    self.titles = try decoder.decode([Title].self, from: fileContent)
                } catch {
                }
            }
        }
    }
    
    
    func getTitle() -> [Title] {
        return self.titles;
    }
}
