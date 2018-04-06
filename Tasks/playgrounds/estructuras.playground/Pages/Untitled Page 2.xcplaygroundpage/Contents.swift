//: [Previous](@previous)

import Foundation

enum EstadoDocumento: Int {
  case Recibido = 0, Validado, EnProceso, Publicado
}


let valorEstado = EstadoDocumento.Validado.rawValue
let estado = EstadoDocumento(rawValue: 2)
