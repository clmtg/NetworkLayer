//
//  CategoriesDecoder.swift
//  NetworkLayer
//
//  Created by Clément Garcia on 27/10/2022.
//

import Foundation

/// Handle the decoding of a Json to a categories list
struct CategoriesDecoder {
    
    /// Enumeration of errors to use if json decoding failes
    enum decoderError: Error {
        case invalideJson
    }
    
    /// Struct function to decode json. The json should be related to a categories list
    /// - Parameter data: Json to decode
    /// - Returns: A categories list based on the json provided
    static func decode(data: Data) throws -> CategoriesList {
        guard let jsonDecoded = try? JSONDecoder().decode(CategoriesList.self, from: data) else {
            throw self.decoderError.invalideJson
        }
        return jsonDecoded
    }
    
}
