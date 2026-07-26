//
//  SearchPodcastResponseDTO.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

struct SearchPodcastResponseDTO: Decodable {
    let results: [PodcastDTO]
}
