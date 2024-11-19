//
//  DataService.swift
//  IosYTApi
//
//  Created by Monisankar Nath on 19/11/24.
//

import Foundation

struct DataService {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideo() async -> [Video] {
        
        // check api key present
        guard apiKey != nil else {
            return [Video]()
        }
        // create url
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=20&playlistId=PLw_akVs2LxPsfPLvQDstxhbQ91EdZVBfu&key=\(apiKey!)"
        let url = URL(string: urlString)
        
        if let url = url {
            // create request
            let request = URLRequest(url: url)
            let session = URLSession.shared
            // send the request
            do {
                let (data, _) = try await session.data(for: request);
                //parse
                
                let decoder = JSONDecoder()
                let playlist = try decoder.decode(Playlist.self, from: data)
                return playlist.items;
                
            } catch {
                print(error)
            }
            
        }
        
        
        
        
        return [Video]()
    }
}
