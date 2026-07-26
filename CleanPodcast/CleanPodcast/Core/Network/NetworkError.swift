//
//  NetworkError.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingFailed(Error)
    case transportError(Error)
    
    var errorDescription: String? {
        switch self {

        case .invalidURL:
            return "The URL is invalid."

        case .invalidResponse:
            return "The server returned an invalid response."

        case .invalidStatusCode(let code):
            return "Server returned status code \(code)."

        case .decodingFailed:
            return "Unable to decode the response."

        case .transportError(let error):
            return error.localizedDescription
        }
    }
}
