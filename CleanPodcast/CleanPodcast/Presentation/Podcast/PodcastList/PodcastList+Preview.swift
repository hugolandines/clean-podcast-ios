//
//  PodcastListPreview.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

private final class MockPodcastRepository: PodcastRepository {

    func search(query: String) async throws -> [Podcast] {
        [
            Podcast(
                id: 1,
                name: "Swift by Sundell",
                artist: "John Sundell",
                artworkURL: URL(string: "https://picsum.photos/200?1"),
                genre: "Technology",
                episodeCount: 250
            ),
            Podcast(
                id: 2,
                name: "Swift Over Coffee",
                artist: "Paul Hudson & Sean Allen",
                artworkURL: URL(string: "https://picsum.photos/200?2"),
                genre: "Technology",
                episodeCount: 180
            ),
            Podcast(
                id: 3,
                name: "Stacktrace",
                artist: "John Sundell & Gui Rambo",
                artworkURL: URL(string: "https://picsum.photos/200?3"),
                genre: "Software Development",
                episodeCount: 320
            )
        ]
    }
}

enum PodcastListPreview {

    static let viewModel: PodcastListViewModel = {

        let repository = MockPodcastRepository()

        let useCase = SearchPodcastsUseCase(
            repository: repository
        )

        return PodcastListViewModel(
            searchPodcastsUseCase: useCase
        )

    }()
}
