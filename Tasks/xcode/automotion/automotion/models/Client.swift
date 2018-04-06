//
//  Client.swift
//  automotion
//
//  Created by Margaro on 16/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import Foundation

struct Client {
  let firstName: String?
  let lastName: String?
  let gender: Character
  let email: String
  var fullName: String {
    return "\(firstName ?? (lastName != nil ? "": "No name")) \(lastName ?? "")"
  }
  
}
