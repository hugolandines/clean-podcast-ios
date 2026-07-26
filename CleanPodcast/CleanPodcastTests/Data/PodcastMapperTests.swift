//
//  PodcastMapperTests.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 26/07/26.
//

import Foundation
import Testing
@testable import CleanPodcast

struct PodcastMapperTests {

    @Test
    func mapsPodcastDTOToPodcast() {

        let dto = PodcastDTO(
            trackId: 1,
            trackName: "Swift Podcast",
            artistName: "Apple",
            artworkUrl600: URL(string: "https://example.com/podcast.png"),
            primaryGenreName: "Technology",
            trackCount: 42
        )

        let expectedPodcast = Podcast(
            id: 1,
            name: "Swift Podcast",
            artist: "Apple",
            artworkURL: URL(string: "https://example.com/podcast.png"),
            genre: "Technology",
            episodeCount: 42
        )

        let podcast = PodcastMapper.map(dto)

        #expect(podcast == expectedPodcast)
    }
}
