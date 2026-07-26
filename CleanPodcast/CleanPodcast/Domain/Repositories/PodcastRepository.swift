//
//  PodcastRepository.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

protocol PodcastRepository {
    func search(query: String) async throws  -> [Podcast]
}
