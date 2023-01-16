//
//  JokeModel.swift
//  4month4hw
//
//  Created by islam on 13/1/23.
//

import Foundation


class JokeModel {
    private weak var controller: JokeController!
    
    private var networkManager = NetworkManager()
    
    init(controller: JokeController) {
        self.controller = controller
    }
    
    func getJokes() {
        networkManager.getJokesList { joke in
            self.controller.setJoke(joke: joke ?? Joke(setup: "default", punchline: "default"))
        }
    }
}


struct Joke: Codable {
    var setup: String
    var punchline: String
}




