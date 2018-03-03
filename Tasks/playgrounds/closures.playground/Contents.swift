//: Playground - noun: a place where people can play

import UIKit

//: Closures

var miClosure: (Int, Int) -> Int
var miClosure2: (Int, Int) -> Int

miClosure = {(a: Int, b: Int) -> Int in
  return a + b
}

miClosure2 = {(a: Int, b: Int) -> Int in
  return a * b
}

let resultado = miClosure(3, 2)

func ejecutaOperacion(_ closure:(Int, Int) -> Int, a: Int, b: Int) {
  print("Resultado = \(closure(a, b))")
}

ejecutaOperacion(miClosure, a: 10, b: 20)
ejecutaOperacion(miClosure2, a: 50, b: 5)
// ejecutaOperacion({ a / b}, a: 50, b: 5)

miClosure = {(a, b) in
  a + b
}


miClosure = {
  $0 + $1
}

var closureSinRetorno:() -> Void = {
  print("No regresaré nada")
}

closureSinRetorno()

var closureSinRetorno2 = { () -> Void in
  print("No regresaré nada")
}

closureSinRetorno2()

var numero = 0

func incrementa(variable: inout Int) {
  variable += 1
}

incrementa(variable: &numero)


let incrementaV2 = {
  numero += 2
}


incrementaV2()
incrementaV2()
incrementaV2()

numero

func incrementaClosure() -> () -> Int {
  var contador = 0
  let incrementa = { () -> Int in
    contador += 1
    return contador
  }
  return incrementa
}

let contador1 = incrementaClosure()
let contador2 = incrementaClosure()

contador1()
contador1()
contador2()
contador1()



var letras = ["Z", "CCCCC", "MMMHHHHH", "OO", "Hiiiiiiiiii"]

letras.sorted()

letras = letras.sorted {
  $0.count < $1.count
}

print(letras)

letras.forEach {
  print("\($0)")
}

let numeros = [2.3, 3.1, 4.7, 5.2, 7.8, 9.1, 10]

numeros.forEach{
  print("\($0)")
}

let filtrados = numeros.filter{
  return $0 > 5
}

print(filtrados)

let mapeados = numeros.map{
  return $0 * 10
}

print(mapeados)

let letrasYNumeros = ["Hola", "0", "Adios", "1", "3"]

let numerosUsuario = letrasYNumeros.flatMap{
  Int($0)
}

print(numerosUsuario)



let total = numeros.reduce(0) {
  return $0 + $1
}

print(total)



