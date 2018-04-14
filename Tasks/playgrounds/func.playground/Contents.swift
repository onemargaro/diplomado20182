//: Playground - noun: a place where people can play

import Cocoa

let numbers = [2,4,31,3,56,42,14]
func compareAscending(i: Int, j: Int) -> Bool {
  return i > j
}

let sortedNumbers = numbers.sorted(by: compareAscending)


let sortedNumbers2 = numbers.sorted(by: {
  (i: Int, j: Int) -> Bool in
  return i > j
})


let mappedNumbers = numbers.map({
  (i: Int) -> Int in
  return i * 3
})

//En swift si se pasa como último parametro se pueden omitir los parentesis
let mappedNumbers2 = numbers.map {
  (i: Int) -> Int in
  return i * 3
}








typealias myFunction = (String) -> Void

func repeatPrint(times: Int) -> myFunction {
  func printer(text: String) {
    for _ in 1...times {
      print(text)
    }
  }
  return printer
}

let log = repeatPrint(times: 5)
log("Hola")

let log2 = repeatPrint(times: 3)
log("Hola2")


func addTwoNumbers(number1: Int, number2: Int) -> Int {
  return number1 + number2
}

var storedFun = addTwoNumbers
storedFun(5, 9)

var storedClosure: (Int, Int) -> Int = { (number1, number2) in
  return number1 + number2
}

storedClosure(5, 9)


//var storedClosure2: (Int, Int) -> Int = { return $0 + $1 }
var storedClosure2: (Int, Int) -> Int = { $0 + $1 } //se puede omitir el return
storedClosure2(5, 9)





