//
//  ClientLoading.swift
//  NetworkLayer
//
//  Created by Clément Garcia on 27/10/2022.
//

import Foundation

protocol ClientLoading {
    func data(from url: URL) async throws -> (Data, HTTPURLResponse)

}
