//
//  MockSearchPodcastsUseCase.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 26/07/26.
//

@testable import CleanPodcast

final class MockSearchPodcastsUseCase: SearchPodcastsUseCaseProtocol {

    var podcasts: [Podcast] = []

    var error: Error?

    private(set) var receivedQuery: String?

    private(set) var executeCallCount = 0

    func execute(query: String) async throws -> [Podcast] {

        executeCallCount += 1
        receivedQuery = query

        if let error {
            throw error
        }

        return podcasts
    }
}
