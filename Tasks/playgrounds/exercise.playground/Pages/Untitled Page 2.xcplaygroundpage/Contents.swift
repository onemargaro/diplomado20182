//: [Previous](@previous)

import Foundation
//sueldo menor a 0 error: sueldo = -16% IVA
//descuentos
class Empleado {
  var sueldo: Double {
    didSet{
      print("hola")
      if(sueldo < 0) {
        print("El valor del sueldo no puede ser negativo")
      } else {
        sueldo = oldValue
      }
    }
  }
  init(sueldo: Double, descuentos: Double) {
    self.sueldo = sueldo - (sueldo*0.16) - descuentos
  }
}

var benja = Empleado(sueldo: 1000, descuentos: 1100)
