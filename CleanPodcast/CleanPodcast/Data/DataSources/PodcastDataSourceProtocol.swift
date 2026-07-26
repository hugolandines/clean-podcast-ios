//
//  PodcastDataSourceProtocol.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 26/07/26.
//

protocol PodcastDataSourceProtocol {
    func search(query: String) async throws -> [PodcastDTO]
}
