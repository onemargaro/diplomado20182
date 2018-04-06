//
//  UserService.swift
//  MasterDetailsApp
//
//  Created by Margaro on 17/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import Foundation
typealias UserResponse = ([User]?) -> Void
struct UserService {
  func loadOneUser() -> User {
    return User(username: "onemargaro", email: "sichibukay@icloud.com", gender: Gender.Male, age: 23)

  }
  func loadUsers() -> [User]{
    return [
      User(username: "onemargaro", email: "sichibukay@icloud.com", gender: Gender.Male, age: 23),
      User(username: "struts", email: "struts@developers.apple.com", gender: Gender.Male, age: 24)
    ]
  }
  func getUsers(_ completion: UserResponse) -> Void {
    completion(loadUsers())
  }
}
