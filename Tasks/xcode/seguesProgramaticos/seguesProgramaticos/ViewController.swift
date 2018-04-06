//
//  ViewController.swift
//  seguesProgramaticos
//
//  Created by Margaro on 09/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  //primer método
  @IBOutlet weak var textField: UITextField!
  //=======
  @IBOutlet weak var switchSegue: UISwitch!
  override func viewDidLoad() {
    super.viewDidLoad()
    textField.delegate = self //segundo método
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showBlueView(_ sender: UIButton) {
    if switchSegue.isOn {
      performSegue(withIdentifier: "blue", sender: nil)
    }
  }
  
  @IBAction func hideKerboard(_ sender: UIButton) {
    self.textField.resignFirstResponder()
  }
  
  @IBAction func showGreenView(_ sender: UIButton) {
    if switchSegue.isOn {
      performSegue(withIdentifier: "green", sender: nil)
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return textField.resignFirstResponder()
  }
  
}
















