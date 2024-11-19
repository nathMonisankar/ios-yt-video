//
//  VideoDetailView.swift
//  IosYTApi
//
//  Created by Monisankar Nath on 19/11/24.
//

import SwiftUI
import YouTubePlayerKit

struct VideoDetailView: View {
    var video: Video
    var body: some View {
        GeometryReader { proxy in
            VStack (alignment: .leading) {
                
                // configure yt player
                let youTubePlayer = YouTubePlayer(
                    source: .video(id: video.snippet?.resourceId.videoId ?? ""),
                    configuration: .init(
                        autoPlay: false
                    )
                )
                YouTubePlayerView(youTubePlayer)
                    .frame(width: proxy.size.width, height: proxy.size.width / 1.78)
                
                ScrollView {
                    VStack (alignment: .leading) {
                        Text(video.snippet?.title ?? "")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(video.snippet?.description ?? "")
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
            }
        }
    }
}

