//: [Previous](@previous)

import Foundation

enum ResultadoWebService {
  case Exito(String)
  case Error(Int)
}

func llamadaWS() -> ResultadoWebService {
  if true {
    return ResultadoWebService.Exito("Mi Contenido")
  } else{
    return ResultadoWebService.Error(502)
  }
}

let resultado: ResultadoWebService = llamadaWS()
switch resultado {
  case let .Exito(contenido):
    print(contenido)
  case let .Error(codigo):
    print("El código de error es \(codigo)")
}
