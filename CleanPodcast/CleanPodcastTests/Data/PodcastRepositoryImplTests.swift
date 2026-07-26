//
//  PodcastRepositoryImplTests.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 26/07/26.
//

import Testing
@testable import CleanPodcast

@MainActor
struct PodcastRepositoryImplTests {
    
    @Test
    func returnsMappedPodcastsWhenDataSourceSucceeds() async throws {
        
        let dataSource = MockPodcastDataSource()
        
        dataSource.podcastDTOs = [
            PodcastDTO(
                trackId: 1,
                trackName: "Swift Podcast",
                artistName: "Apple",
                artworkUrl600: nil,
                primaryGenreName: nil,
                trackCount: nil
            )
        ]
        
        let sut = PodcastRepositoryImpl(dataSource: dataSource)
        
        let podcasts = try await sut.search(query: "swift")
        
        #expect(podcasts.count == 1)
        #expect(podcasts.first?.id == 1)
        #expect(podcasts.first?.name == "Swift Podcast")
        #expect(podcasts.first?.artist == "Apple")
        
        #expect(dataSource.receivedQuery == "swift")
        #expect(dataSource.searchCallCount == 1)
    }
    
    @Test
    func throwsErrorWhenDataSourceFails() async {

        enum DummyError: Error {
            case networkFailure
        }

        let dataSource = MockPodcastDataSource()
        dataSource.error = DummyError.networkFailure

        let sut = PodcastRepositoryImpl(dataSource: dataSource)

        await #expect(throws: DummyError.self) {
            try await sut.search(query: "swift")
        }

        #expect(dataSource.searchCallCount == 1)
        #expect(dataSource.receivedQuery == "swift")
    }
}
