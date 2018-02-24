//: Playground - noun: a place where people can play

import UIKit

func sonPalindromos(cadena: String) -> Bool {
  if String(cadena.reversed()) == cadena {
    return true
  } else {
    return false
  }
}

sonPalindromos(cadena: "anitalavalatina")
