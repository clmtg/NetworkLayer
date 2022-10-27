//
//  CategoriesLoaderTest.swift
//  NetworkLayerTests
//
//  Created by Clément Garcia on 27/10/2022.
//

import XCTest
@testable import NetworkLayer

final class CategoriesLoaderTest: XCTestCase {
    
    // MARK: - Tests related to JSON decodder
    
    func testGivenJsonIncorrect_WhenDecode_ThenErrorThrowns() {
        let dataToDecode = makeIncorrectData()
        do {
            _ = try CategoriesDecoder.decode(data: dataToDecode)
            XCTFail("An error should occured. Data are incorrect")
        } catch {
            XCTAssertTrue(error as! CategoriesDecoder.decoderError == CategoriesDecoder.decoderError.invalideJson)
        }
    }
    
    func testJsonIsCorrect_WhenDecode_NoErrors() {
        let dataToDecode = makeCategoriesListJson()
        
        do {
            let catgoriesList = try CategoriesDecoder.decode(data: dataToDecode)
            XCTAssertTrue(catgoriesList.count == 3)
            print(catgoriesList)
        } catch {
            XCTFail("An unexpected error occured. Data should be decodable as Json is valid")
        }
    }
    
    // MARK: - Tests related to JSON loader (downloading and decoding Json)
    
    func testGivenServicesAreOk_WhenLoadList_ThenCorrectDataProvided() {
        let client = HttpClientForTests(dataToUse: makeIncorrectData(), reponseToUse: HTTPURLResponse.init(statusCode: 200))
    }
    
    

}
