//
//  ContentView.swift
//  CleanPodcast
//
//  Created by Hugo Landines on 23/07/26.
//

import SwiftUI
import Observation

struct PodcastListView: View {

    let viewModel: PodcastListViewModel

    var body: some View {
        @Bindable var viewModel = viewModel
        
        NavigationStack {
            VStack {

                TextField("Search podcasts", text: $viewModel.state.searchText)
                    .textFieldStyle(.roundedBorder)

                Button("Search") {
                    Task {
                        await viewModel.send(.searchPodcasts)
                    }
                }

                if viewModel.state.isLoading {
                    ProgressView()
                }
                
                if let errorMessage = viewModel.state.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .font(.caption)
                }

                List(viewModel.state.podcasts) { podcast in
                    VStack(alignment: .leading) {
                        Text(podcast.name)
                            .font(.headline)

                        Text(podcast.artist)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding()
            .navigationTitle("Podcasts")
        }
    }
}

#Preview {
    PodcastListView(
        viewModel: PodcastListPreview.viewModel
    )
}
