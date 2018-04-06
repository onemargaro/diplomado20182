//: Playground - noun: a place where people can play

import UIKit

enum Dia {
  case Lunes
  case Martes
  case Miércoles
  case Jueves
  case Viernes
}

var diaSemana: Dia
diaSemana = .Lunes

switch diaSemana {
case .Lunes:
  print("Otra vez a trabajar")
case .Martes:
  print("Ya quiero que acabe la semana")
case .Miércoles:
  print("Apenas vamos a la mitad de semana")
case .Jueves:
  print("Ya casi es fin de semana")
case .Viernes:
  print("¡Por fin es viernes!")
}
