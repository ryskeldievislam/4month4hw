//
//  ViewController.swift
//  4month4hw
//
//  Created by islam on 13/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var controller: JokeController?
    
    var jokesData: Joke = Joke(setup: "default", punchline: "default")
    
    private lazy var jokeSetupLabel: UILabel = {
        let jokeSetupLabel = UILabel()
        jokeSetupLabel.numberOfLines = 0
        jokeSetupLabel.lineBreakMode = .byWordWrapping
        jokeSetupLabel.textColor = .white
        jokeSetupLabel.textAlignment = .center
        return jokeSetupLabel
    }()
    
    private lazy var makeJokeBTN: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Make joke", for: .normal)
        btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(showPunchline), for: .touchUpInside)
        return btn
    }()
    
    
    @objc func showPunchline() {
        
        if jokesData.setup == "default"{
            jokeSetupLabel.text = "Упс, шутки еще не прогрузились. Попробуйте еще раз через 3 сек!"
            controller?.updateJokesList()
        } else {
            jokeUserTF.resignFirstResponder()
            jokeUserTF.text = ""
            if makeJokeBTN.titleLabel?.text == "Make joke" {
                jokeSetupLabel.text = jokesData.setup
                print(jokesData.punchline)
            } else if makeJokeBTN.titleLabel?.text == "Answer" {
                if jokesData.punchline == jokeUserTF.text {
                    let alert = UIAlertController(title: "Absolutly correct", message: "well done", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Yass!", style: .default))
                    present(alert, animated: true)
                } else {
                    let alert = UIAlertController(title: "Incorrect", message: "correct answer: \(jokesData.punchline)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue!", style: .default))
                    present(alert, animated: true)
                }
                makeJokeBTN.setTitle("Make joke", for: .normal)
                controller?.updateJokesList()
            }
        }
    }
    
    private lazy var jokeUserTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.addTarget(self, action: #selector(changeBtnTitle), for: .editingDidBegin)
        tf.placeholder = "Введи свой ответ"
        return tf
        
    }()
    
    @objc func changeBtnTitle () {
        makeJokeBTN.setTitle("Answer", for: .normal)
    }
    
    
    private lazy var jokePunchlineLabel: UILabel = {
        let jokePunchlineLabel = UILabel()
        jokePunchlineLabel.numberOfLines = 0
        jokePunchlineLabel.lineBreakMode = .byWordWrapping
        jokePunchlineLabel.textAlignment = .center
        jokePunchlineLabel.textColor = .white
        return jokePunchlineLabel
        
    }()
    
    
    private func setup () {
        view.backgroundColor = .black
        view.addSubview(jokeSetupLabel)
        jokeSetupLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(200)
        }
        view.addSubview(makeJokeBTN)
        makeJokeBTN.snp.makeConstraints { make in
            make.top.equalTo(jokeSetupLabel.snp.bottom).offset(50)
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
        }
        view.addSubview(jokeUserTF)
        jokeUserTF.snp.makeConstraints { make in
            make.top.equalTo(makeJokeBTN.snp.bottom).offset(100)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(80)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        controller = JokeController(view: self)
        controller?.updateJokesList()
        setup()
    }


}

