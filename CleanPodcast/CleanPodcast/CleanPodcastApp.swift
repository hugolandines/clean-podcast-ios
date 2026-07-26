//
//  CleanPodcastApp.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 23/07/26.
//

import SwiftUI

@main
struct CleanPodcastApp: App {
    private let container = DependencyContainer()
    var body: some Scene {
        WindowGroup {
            PodcastListView(viewModel: container.makePodcastListViewModel())
        }
    }
}
