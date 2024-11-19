//
//  FeedView.swift
//  IosYTApi
//
//  Created by Monisankar Nath on 19/11/24.
//

import SwiftUI

struct FeedView: View {
    @State private var videos = [Video]()
    @State private var selectedVideo: Video?
    var body: some View {
        List(videos) { video in
            VideoRowView(video: video)
                .onTapGesture {
                    selectedVideo = video
                }
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .task {
            self.videos = await DataService().getVideo()
        }
        .sheet(item: $selectedVideo) { video in
            VideoDetailView(video: video)
        }
    }
}

#Preview {
    FeedView()
}
