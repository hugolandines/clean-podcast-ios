//
//  PodcastListState.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 24/07/26.
//

struct PodcastListState {
    var searchText = ""
    var podcasts: [Podcast] = []
    var isLoading = false
    var errorMessage: String?
}
