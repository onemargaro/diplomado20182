//: [Previous](@previous)

import Foundation

protocol Evaluable {
  func examinar() -> String
}

extension Evaluable {
  func decidir(_ promedio: Double?) -> String {
    guard let p = promedio, p < 6.0 else {
      return "Aprobado"
      
    }
    return "Reprobado"
  }
}

class Alumno {
  var numCuenta: String
  init(_ numCuenta: String) {
    self.numCuenta = numCuenta
  }
}

class Ingeniero: Alumno, Evaluable {
  
  func examinar() -> String {
    self.estatus = self.decidir(self.promedio)
    return self.estatus
  }
  
  var promedio: Double?
  var estatus: String
  
  override init(_ numCuenta: String) {
    self.estatus = "Reprobado"
    super.init(numCuenta)
  }
  
  convenience init(_ numCuenta: String, _ promedio: Double) {
    self.init(numCuenta)
    self.promedio = promedio
    self.estatus = "Reprobado"
  }
}

var alumno1: Ingeniero = Ingeniero("310282527", 7.8)
var alumno2: Ingeniero = Ingeniero("310282527", 5.3)

alumno1.examinar()
alumno2.examinar()
