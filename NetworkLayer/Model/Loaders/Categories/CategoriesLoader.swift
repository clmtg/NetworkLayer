//
//  CategoriesLoader.swift
//  NetworkLayer
//
//  Created by Clément Garcia on 27/10/2022.
//

import Foundation

/// Handle the categories list retreival
struct CategoriesLoader {
    
    /// Object confirming to ClientLoading protocol and used to download categories list json
    private var client: ClientLoading
    
    init(client: ClientLoading) {
        self.client = client
    }
    
    /// Load a categories based on a resource provided
    /// - Parameter url: categories list file url
    /// - Returns: List of categories
    func loadList(url: URL) async throws -> CategoriesList {
        guard let (data, response) = try? await client.data(from: url),
              response.statusCode == 200 else {
            throw URLError(.notConnectedToInternet)
        }
        let dataDecoded = try CategoriesDecoder.decode(data: data)
        return dataDecoded
    }
}
