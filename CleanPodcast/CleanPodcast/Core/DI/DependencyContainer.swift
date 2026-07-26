//
//  DependencyContainer.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

final class DependencyContainer {

    // MARK: - Core

    private lazy var networkClient = NetworkClient()

    // MARK: - Data

    private lazy var podcastDataSource = PodcastDataSource(
        networkClient: networkClient
    )

    private lazy var podcastRepository: PodcastRepository = PodcastRepositoryImpl(
        dataSource: podcastDataSource
    )

    // MARK: - Domain

    func makeSearchPodcastsUseCase() -> SearchPodcastsUseCase {
        SearchPodcastsUseCase(
            repository: podcastRepository
        )
    }

    // MARK: - Presentation

    func makePodcastListViewModel() -> PodcastListViewModel {
        PodcastListViewModel(
            searchPodcastsUseCase: makeSearchPodcastsUseCase()
        )
    }
}
