//
//  ViewController.swift
//  Quiz
//
//  Created by Margaro on 17/02/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var answerLabel: UILabel!
  let questions: [String] = [
    "What is 7+7?",
    "What is the capital of Vermont?",
    "What is cognac made from?"
  ]
  let answers: [String] = [
    "14",
    "Montpelier",
    "Grapes"
  ]
  var currentQuestionIndex: Int = 0
  @IBAction func showNextQuestion(_ sender: UIButton){
    currentQuestionIndex += 1
    if currentQuestionIndex == questions.count {
      currentQuestionIndex = 0
    }
    let question: String = questions[currentQuestionIndex]
    questionLabel.text = question
    answerLabel.text = "???"
  }
  
  @IBAction func showAnswer(_ sender: UIButton){
    let answer: String = answers[currentQuestionIndex]
    answerLabel.text = answer
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    questionLabel.text = questions[currentQuestionIndex]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

