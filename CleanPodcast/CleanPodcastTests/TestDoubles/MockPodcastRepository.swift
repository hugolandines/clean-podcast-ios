//
//  MockPodcastRepository.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 25/07/26.
//

@testable import CleanPodcast

final class MockPodcastRepository: PodcastRepository {

    var podcasts: [Podcast] = []

    var error: Error?

    private(set) var receivedQuery: String?
    
    private(set) var searchCallCount = 0

    func search(query: String) async throws -> [Podcast] {
        searchCallCount += 1
        receivedQuery = query

        if let error {
            throw error
        }

        return podcasts
    }
}
