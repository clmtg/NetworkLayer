//
//  CategoriesList.swift
//  NetworkLayer
//
//  Created by Clément Garcia on 27/10/2022.
//

import Foundation

// MARK: - CategoriesListElement
struct CategoriesListOneElement: Decodable {
    let id: Int
    let name: String
}

typealias CategoriesList = [CategoriesListOneElement]
