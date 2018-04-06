//: Playground - noun: a place where people can play

import UIKit

class Alumno {
  var numCuenta: String
  var edad: Int {
    willSet{
      print(edad)
      print("El nuevo valor: \(newValue)")
    }
    didSet{
      print("El nuevo valor: \(oldValue)")
    }
  }
  init(numCuenta: String) {
    self.numCuenta = numCuenta
    self.edad = 20
  }
  
  func toString() {
    print("Hola desde alumno")
  }
  
}

class Ingenieria: Alumno {
  override func toString() {
    print("Alumno chido de inge")
  }
}

class Contador: Alumno {
  override func toString() {
    print("Alumno meco de conta")
  }
}


var alumnoInge = Ingenieria(numCuenta: "Chido")
var alumnoConta = Contador(numCuenta: "Chido")
alumnoInge.edad = 30

alumnoInge.toString()
alumnoConta.toString()

