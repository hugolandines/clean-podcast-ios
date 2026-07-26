//
//  Untitled.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 26/07/26.
//

@testable import CleanPodcast

final class MockPodcastDataSource: PodcastDataSourceProtocol {

    var podcastDTOs: [PodcastDTO] = []

    var error: Error?

    private(set) var receivedQuery: String?

    private(set) var searchCallCount = 0

    func search(query: String) async throws -> [PodcastDTO] {

        searchCallCount += 1
        receivedQuery = query

        if let error {
            throw error
        }

        return podcastDTOs
    }
}
