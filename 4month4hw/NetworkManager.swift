//
//  NetworkManager.swift
//  4month4hw
//
//  Created by islam on 13/1/23.
//

import Foundation

class NetworkManager {
    
    func getJokesList(completion: @escaping (Joke?) -> Void ) {
        let url = URL(string: "https://official-joke-api.appspot.com/random_joke")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data, let response = try? JSONDecoder().decode(Joke.self, from: data) else {
                    completion(nil)
                    return
                }
                completion(response)
            }
        }
        task.resume()
    }
    
}
