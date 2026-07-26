//
//  PodcastDataSource.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

final class PodcastDataSource: PodcastDataSourceProtocol {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    private func makeSearchRequest(query: String, method: HTTPMethod) throws -> URLRequest {

        /// URL example: https://itunes.apple.com/search?media=podcast&term=swift
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/search"
        components.queryItems = [
            URLQueryItem(name: "media", value: "podcast"),
            URLQueryItem(name: "term", value: query)
        ]

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }

    func search(query: String) async throws -> [PodcastDTO] {
        
        let request = try makeSearchRequest(
            query: query,
            method: .get
        )

        let response: SearchPodcastResponseDTO = try await networkClient.request(request)
        return response.results
    }

}
