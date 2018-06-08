//
//  LoginViewController.swift
//  firebase
//
//  Created by Margaro on 05/05/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
  override func viewDidLoad() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Salir", style: .plain, target: self, action: #selector(logoutUser))
  }
  
  @objc func logoutUser() {
    do {
      try Auth.auth().signOut()
      self.navigationController?.popViewController(animated: true)
    } catch {
      print("Eres una mamada")
    }
  }
}
