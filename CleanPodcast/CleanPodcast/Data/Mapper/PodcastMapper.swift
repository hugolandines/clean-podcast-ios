//
//  PodcastMapper.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

struct PodcastMapper {

    static func map(_ dto: PodcastDTO) -> Podcast {
        Podcast(
            id: dto.trackId,
            name: dto.trackName,
            artist: dto.artistName,
            artworkURL: dto.artworkUrl600,
            genre: dto.primaryGenreName,
            episodeCount: dto.trackCount
        )
    }
}
