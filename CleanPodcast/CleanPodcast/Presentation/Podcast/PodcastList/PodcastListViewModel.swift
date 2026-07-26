//
//  PodcastListViewModel.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class PodcastListViewModel {

    var state = PodcastListState()

    private let searchPodcastsUseCase: SearchPodcastsUseCaseProtocol

    init(searchPodcastsUseCase: SearchPodcastsUseCaseProtocol) {
        self.searchPodcastsUseCase = searchPodcastsUseCase
    }
    
    func send(_ action: PodcastListAction) async {
        switch action {
        case .searchPodcasts:
            await performSearch()
        }
    }

    private func performSearch() async {
        
        state.isLoading = true
        state.errorMessage = nil
        
        defer {
            state.isLoading = false
        }

        do {
            state.podcasts = try await searchPodcastsUseCase.execute(query: state.searchText)
        } catch {
            state.errorMessage = error.localizedDescription
        }
    }
}
