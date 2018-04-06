//: Playground - noun: a place where people can play

import UIKit

class Person {
  var firstName: String
  var lastName: String
  var age: Int
  static var count: Int = 0
  var id: Int
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = 0
    Person.count += 1
    self.id = Person.count
  }
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
  
  init?(_ firstName: String, _ lastName: String, _ age: Int?) {
    guard let a = age else { return nil }
    self.firstName = firstName
    self.lastName = lastName
    Person.count += 1
    self.id = Person.count
    self.age = a
  }
  
  required init(age: Int) {
    self.firstName = "John"
    self.lastName = "Doe"
    self.age = age
    Person.count += 1
    self.id = Person.count
  }
  
  static func < (left: Person, right: Person) -> Bool {
    return left.age > right.age
  }
  
  static func += (_ left: Person,_ amount: Int) {
    return left.age += amount
  }
}

class Student: Person {
  var partner: Student?
  deinit {
    print("\(firstName) fuera... ")
  }
}

var parra: Student? = Student(firstName: "Parra", lastName: "Parrita")
var julio: Student? = Student(firstName: "Julio", lastName: "Julito")

parra?.partner = julio
julio?.partner = parra

julio = nil
parra = nil


