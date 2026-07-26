//
//  Podcast.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

struct Podcast: Identifiable, Equatable {
    let id: Int
    let name: String
    let artist: String
    let artworkURL: URL?
    let genre: String?
    let episodeCount: Int?
}

