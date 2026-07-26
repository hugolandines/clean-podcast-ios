//
//  SearchPodcastsUseCaseTests.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 25/07/26.
//

import Testing
@testable import CleanPodcast

@MainActor
struct SearchPodcastsUseCaseTests {

    @Test
    func returnsPodcastsWhenRepositorySucceeds() async throws {

        let repository = MockPodcastRepository()

        repository.podcasts = [
            Podcast(
                id: 1,
                name: "Swift Podcast",
                artist: "Apple",
                artworkURL: nil,
                genre: nil,
                episodeCount: nil
            )
        ]

        let sut = SearchPodcastsUseCase(repository: repository)

        let result = try await sut.execute(query: "swift")

        #expect(result.count == 1)
        #expect(result.first?.name == "Swift Podcast")
        #expect(result.first?.artist == "Apple")
        #expect(repository.receivedQuery == "swift")
    }
    
    @Test
    func throwsErrorWhenRepositoryFails() async {

        enum DummyError: Error {
            case networkFailure
        }

        let repository = MockPodcastRepository()
        repository.error = DummyError.networkFailure

        let sut = SearchPodcastsUseCase(repository: repository)

        await #expect(throws: DummyError.self) {
            try await sut.execute(query: "swift")
        }

        #expect(repository.searchCallCount == 1)
    }
    
    @Test
    func returnsEmptyArrayWhenQueryIsBlank() async throws {

        let repository = MockPodcastRepository()

        let sut = SearchPodcastsUseCase(repository: repository)

        let podcasts = try await sut.execute(query: "   ")

        #expect(podcasts.isEmpty)
        #expect(repository.searchCallCount == 0)
    }
    
    @Test
    func trimsWhitespaceBeforeSearching() async throws {

        let repository = MockPodcastRepository()

        let sut = SearchPodcastsUseCase(repository: repository)

        _ = try await sut.execute(query: "  swift ")

        #expect(repository.receivedQuery == "swift")
        #expect(repository.searchCallCount == 1)
    }
}
