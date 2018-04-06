//
//  User.swift
//  MasterDetailsApp
//
//  Created by Margaro on 17/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import Foundation
import UIKit
struct User {
  let username: String
  let email: String
  let gender: Gender
  let age: Int
  func getIcon() -> UIImage {
    switch gender {
      case .Male:
        return UIImage(named: "Male") ?? UIImage(named: "Default")!
      case .Female:
        return UIImage(named: "Female") ?? UIImage(named: "Default")!
    }
  }
}

enum Gender {
  case Male
  case Female
}
