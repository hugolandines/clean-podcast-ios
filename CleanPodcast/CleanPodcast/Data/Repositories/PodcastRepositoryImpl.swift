//
//  PodcastRepositoryImpl.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

final class PodcastRepositoryImpl: PodcastRepository {

    private let dataSource: PodcastDataSourceProtocol

    init(dataSource: PodcastDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func search(query: String) async throws -> [Podcast] {
        let dtos = try await dataSource.search(query: query)
        return dtos.map(PodcastMapper.map)
    }
}
