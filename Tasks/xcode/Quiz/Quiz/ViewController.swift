//
//  ViewController.swift
//  Quiz
//
//  Created by Margaro on 17/02/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // Connections
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerLabel: UILabel!

  // variables
  var currentQuestionIndex: Int = 0
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

  // System Functions
  override func viewDidLoad() {
    super.viewDidLoad()
    questionLabel.text = questions[currentQuestionIndex]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }



  // My functions

  /**
   * Action will be executed when user press button in view
   * 'Next question'
   * @param  {UIButton} _ sender:       UIButton receive instance of UIButton
   */
  @IBAction func showNextQuestion(_ sender: UIButton) {
    currentQuestionIndex += 1
    if currentQuestionIndex == questions.count {
      currentQuestionIndex = 0
    }
    let question: String = questions[currentQuestionIndex]
    questionLabel.text = question
    answerLabel.text = "???"
  }

  /**
   * Action will be executed when user press button in view
   * 'Show Answer'
   * @param  {UIButton} _ sender:       UIButton receive instance of UIButton
   */
  @IBAction func showAnswer(_ sender: UIButton) {
    let answer: String = answers[currentQuestionIndex]
    answerLabel.text = answer
  }
}
