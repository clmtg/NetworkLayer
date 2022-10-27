//
//  HttpClient.swift
//  NetworkLayer
//
//  Created by Clément Garcia on 27/10/2022.
//

import Foundation

/// Handle the network connection to retrieve data (json etc...)
struct HttpClient : ClientLoading {
    
    /// The session used to download data
    private var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    
    /// Reach to the URL provided in order to download data (Implemented to conform at ClientLoading protocol )
    /// - Parameter url: url to reach
    /// - Returns: The data received and the server reponse
    func data(from url: URL) async throws -> (Data, HTTPURLResponse) {
        guard let (data, response) = try? await session.data(from: url),
              let reponseReceived = response as? HTTPURLResponse else {
            throw URLError(.notConnectedToInternet)
        }
        return (data, reponseReceived)
    }
}
