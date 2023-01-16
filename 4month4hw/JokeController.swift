//
//  JokeController.swift
//  4month4hw
//
//  Created by islam on 13/1/23.
//

import Foundation
import SnapKit



class JokeController {
    private weak var view: ViewController!
    
    private var model: JokeModel?
    
    private var joke: Joke = Joke(setup: "default", punchline: "default")
    
    init(view: ViewController!) {
        self.view = view
        self.model = JokeModel(controller: self)
    }
    
    func setJoke(joke: Joke) {
        self.joke = joke
        view.jokesData = getJokes()
    }
    
    func getJokes() -> Joke { self.joke }
    
    func updateJokesList() {
        model?.getJokes()
    }
    
    
}
