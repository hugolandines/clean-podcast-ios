//
//  ControlledSearchPodcastsUseCase.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 26/07/26.
//
import Foundation
@testable import CleanPodcast

final class ControlledSearchPodcastsUseCase: SearchPodcastsUseCaseProtocol {

    var podcasts: [Podcast] = []
    
    var continuation: CheckedContinuation<Void, Never>?

    func execute(query: String) async throws -> [Podcast] {
        await withCheckedContinuation { continuation in
            self.continuation = continuation
        }

        return podcasts
    }
    
    func resume() {
        continuation?.resume()
    }
}
