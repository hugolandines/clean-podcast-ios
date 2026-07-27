//
//  PodcastListViewModelTests.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 26/07/26.
//

import Foundation
import Testing
@testable import CleanPodcast

@MainActor
struct PodcastListViewModelTests {
    
    @Test
    func loadsPodcastsWhenSearchSucceeds() async {
        
        let expectedPodcasts = [
            Podcast(
                id: 1,
                name: "Swift Podcast",
                artist: "Apple",
                artworkURL: nil,
                genre: nil,
                episodeCount: nil
            )
        ]
        
        let useCase = MockSearchPodcastsUseCase()
        useCase.podcasts = expectedPodcasts
        
        let sut = PodcastListViewModel(searchPodcastsUseCase: useCase)
        sut.state.searchText = "swift"
        await sut.send(.searchPodcasts)
        
        #expect(sut.state.podcasts == expectedPodcasts)
        #expect(sut.state.errorMessage == nil)
        #expect(sut.state.isLoading == false)
        #expect(useCase.executeCallCount == 1)
        #expect(useCase.receivedQuery == "swift")
    }
    
    @Test
    func showsErrorWhenSearchFails() async {
        
        enum DummyError: LocalizedError {
            case networkFailure
            
            var errorDescription: String? {
                "Network failure"
            }
        }
        
        let useCase = MockSearchPodcastsUseCase()
        useCase.error = DummyError.networkFailure
        
        let sut = PodcastListViewModel(searchPodcastsUseCase: useCase)
        sut.state.searchText = "swift"
        await sut.send(.searchPodcasts)
        
        #expect(sut.state.podcasts.isEmpty)
        #expect(sut.state.errorMessage == "Network failure")
        #expect(sut.state.isLoading == false)
        #expect(useCase.executeCallCount == 1)
        #expect(useCase.receivedQuery == "swift")
    }
    
    @Test
    func setsLoadingStateWhileSearching() async {

        let useCase = ControlledSearchPodcastsUseCase()
        let sut = PodcastListViewModel(searchPodcastsUseCase: useCase)

        let task = Task { await sut.send(.searchPodcasts) }
        await Task.yield()

        #expect(sut.state.isLoading == true)
        
        useCase.resume()
        
        await task.value

        #expect(sut.state.isLoading == false)
    }
}
