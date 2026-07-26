//
//  SearchPodcastUseCase.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

import Foundation

struct SearchPodcastsUseCase: SearchPodcastsUseCaseProtocol {

    private let repository: PodcastRepository

    init(repository: PodcastRepository) {
        self.repository = repository
    }

    func execute(query: String) async throws -> [Podcast] {
        
        let normalizedQuery = query
            .trimmingCharacters(in: .whitespacesAndNewlines)

        guard !normalizedQuery.isEmpty else {
            return []
        }
        
        return try await repository.search(query: normalizedQuery)
    }
}
