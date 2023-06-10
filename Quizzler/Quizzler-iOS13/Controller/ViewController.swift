//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var wrongLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //        trueButton.backgroundColor = UIColor.clear
        //        falseButton.backgroundColor = UIColor.clear
        
        let userAnswer = sender.currentTitle! //True,False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion() 
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector:
                                #selector (updateUI), userInfo:nil, repeats: false)
        
    }
    
    @objc func updateUI () {
        questionLable.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLable.text = "Score: \(quizBrain.getScore())"
        wrongLable.text = "False \(quizBrain.wrongScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear

    }
    
}

