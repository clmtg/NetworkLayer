//
//  HttpClientForTests.swift
//  NetworkLayerTests
//
//  Created by Clément Garcia on 27/10/2022.
//

import Foundation
@testable import NetworkLayer

struct HttpClientForTests : ClientLoading {
    
    private var dataToUse: Data
    private var reponseToUse: HTTPURLResponse
    
    init(dataToUse: Data, reponseToUse: HTTPURLResponse) {
        self.dataToUse = dataToUse
        self.reponseToUse = reponseToUse
    }
    
    func data(from url: URL) async throws -> (Data, HTTPURLResponse) {
        return (dataToUse, reponseToUse)
    }
    
    
}
