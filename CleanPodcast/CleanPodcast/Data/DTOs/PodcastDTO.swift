//
//  PodcastDTO.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

struct PodcastDTO: Decodable {
    let trackId: Int
    let trackName: String
    let artistName: String
    let artworkUrl600: URL?
    let primaryGenreName: String?
    let trackCount: Int?
}
