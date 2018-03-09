//
//  ViewController.swift
//  SimpleProfile
//
//  Created by Margaro on 02/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let colorsAvailible = ["Primary", "Secondary", "Text", "Third"]

  let randomColor = { (_ colors: Array<String>) -> Int in
    let count = colors.count - 1
    return Int(arc4random_uniform(UInt32(count)))
  }

  @IBOutlet weak var luffyLabel: UILabel!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var editButton: UIButton!
  @IBOutlet weak var deleteButton: UIButton!
  @IBOutlet weak var descriptionText: UITextView!
  @IBOutlet weak var colorButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func changeColor(_ sender: Any) {
//    Background colors changed
    changeBackgroundColor(element: self.view)
    changeBackgroundColor(element: self.luffyLabel)
    changeBackgroundColor(element: self.saveButton)
    changeBackgroundColor(element: self.editButton)
    changeBackgroundColor(element: self.deleteButton)
    changeBackgroundColor(element: self.descriptionText)
    changeBackgroundColor(element: self.colorButton)
//    Text Color
    self.luffyLabel.textColor = UIColor.init(named: colorsAvailible[randomColor(self.colorsAvailible)])
    self.descriptionText.textColor = UIColor.init(named: colorsAvailible[randomColor(self.colorsAvailible)])


  }

  func changeBackgroundColor(element: UIView){
    let color = colorsAvailible[randomColor(self.colorsAvailible)]
    element.backgroundColor = UIColor.init(named: color)
  }

}

