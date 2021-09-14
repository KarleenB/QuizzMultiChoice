//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let usergGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if usergGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAQuestion()
        aButton.setTitle(answerChoices[0], for: .normal)
        bButton.setTitle(answerChoices[1], for: .normal)
        cButton.setTitle(answerChoices[3], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        aButton.backgroundColor = UIColor.clear
        bButton.backgroundColor = UIColor.clear
        cButton.backgroundColor = UIColor.clear
        
    }
 
}




