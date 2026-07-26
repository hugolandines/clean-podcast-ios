//
//  SearchPodcastsUseCaseProtocol.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 25/07/26.
//

protocol SearchPodcastsUseCaseProtocol {
    func execute(query: String) async throws -> [Podcast]
}
