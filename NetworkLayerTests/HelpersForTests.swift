//
//  HelpersForTests.swift
//  NetworkLayerTests
//
//  Created by Clément Garcia on 27/10/2022.
//

import Foundation
@testable import NetworkLayer

func makeIncorrectData() -> Data {
    return Data("any data".utf8)
}

func makeCategoriesOneElement(for name: String, with id: Int) -> (category: CategoriesListOneElement, preJson: [String: Any]) {
    let generatedCategory = CategoriesListOneElement(id: id, name: name)
    let json: [String: Any] = ["id": id, "name": name]
    return (generatedCategory, json)
}

func makeJson(for item: [[String: Any]]) -> Data {
    return try! JSONSerialization.data(withJSONObject: item)
}

func makeCategoriesListJson() -> Data {
    let cat1 = makeCategoriesOneElement(for: "Cars", with: 1)
    let cat2 = makeCategoriesOneElement(for: "Tables", with: 2)
    let cat3 = makeCategoriesOneElement(for: "Computers", with: 3)
    let dataToDecode = makeJson(for: [cat1.preJson, cat2.preJson, cat3.preJson])
    return dataToDecode
}


func makeFakeUrl() -> URL {
    return URL(string: "http://one-fakeurl.com")!
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: makeFakeUrl(), statusCode: statusCode, httpVersion: .none, headerFields: .none)!
    }
}
