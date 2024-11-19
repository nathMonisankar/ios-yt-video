//
//  HomeView.swift
//  IosYTApi
//
//  Created by Monisankar Nath on 19/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "play.square.stack")
                    Text("Feed")
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}

/*.task {
    // make network request
    
    // define the endpoint url with parameters
    let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLw_akVs2LxPsfPLvQDstxhbQ91EdZVBfu&key=AIzaSyB3OaJ55QByN5L6-KcN82-_26uGzcEr0_o"
    // create a URL instance
    
    let url = URL(string: urlString)
    
    if let url = url {
        // Create a URLRequest instance
        let request  = URLRequest(url: url)
        // Send the request with URLSession
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            // print response
            print(data)
            print(response)
        } catch {
            // handle errors
            print(error)
        }
    }
    
}*/
