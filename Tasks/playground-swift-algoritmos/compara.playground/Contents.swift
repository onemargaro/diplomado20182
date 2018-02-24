//: Playground - noun: a place where people can play

import UIKit
func compara(cadena1: String, cadena2: String) -> Bool {
  if cadena1.count == cadena2.count {
    for i in cadena1 {
      let num1: Int = Array(cadena1).filter{ _ in Array(cadena1).contains(i) }.count
      let num2: Int = Array(cadena2).filter{ _ in Array(cadena2).contains(i) }.count
      if num1 != num2 {
        return false
      }
    }
    return true
  }
  return false
}
compara(cadena1: "holi", cadena2: "holi")

