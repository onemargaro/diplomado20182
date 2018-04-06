//: [Previous](@previous)

import Foundation

// Protocols

protocol Vehiculo {
  var wheels: Int { get }
  func acelerar()
  func frenar()
}

protocol Tuning: Vehiculo {
  func rines(tipo: String)
}

protocol Pintura {
  func colorear()
}

class Motito: Vehiculo, Pintura {
  var wheels: Int {
    get {
      return 2
    }
  }
  
  func acelerar() {
    print("Acelera....")
  }
  
  func frenar() {
    print("Frena...")
  }
  
  func colorear() {
    print("Colorea...")
  }
  
}

protocol Reflexionable {
  var tipoReflexion: String { get }
}

extension String: Reflexionable {
  var tipoReflexion: String {
    return "Cvio muy creativo"
  }
}

let palabrita = "Hola mundo"
palabrita.tipoReflexion
























