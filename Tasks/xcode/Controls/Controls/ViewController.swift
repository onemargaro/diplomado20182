//
//  ViewController.swift
//  Controls
//
//  Created by Margaro on 09/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }  
  
  @IBAction func returnToGrayView(_ view: UIStoryboardSegue) {
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let title = textField.text {
      segue.destination.navigationItem.title = title
    }
  }
  
}

