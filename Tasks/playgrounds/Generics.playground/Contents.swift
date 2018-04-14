//: Playground - noun: a place where people can play

import UIKit

//Generico
func swapGeneric<generico>(a: inout generico, b: inout generico) {
  let temp = a
  a = b
  b = temp
}

var a = 5
var b = 10
swapGeneric(a: &a, b: &b)
print("\(a)")
print("\(b)")

func genericEqual<T: Comparable>(a: inout T, b: inout T) -> Bool {
  return a == b
}

struct List<T> {
  var items = [T]()
  mutating func add(item: T){
    items.append(item)
  }
  
  func getItemAtIndex(index: Int) -> T? {
    guard items.count > index else { return nil}
    return items[index]
  }
}

var stringList = List<String>()
stringList.add(item: "Hola")
stringList.add(item: "Adios")
stringList.add(item: "Margaro")
print(stringList.getItemAtIndex(index: 2)!)


class Generica<T, E> {
  
}

let objetoGenerico = Generica<String, Int>()


protocol myProtocol {
//  Con associatedtype en los protocolos
//  Con where se define el tipo de dato
  associatedtype E
  var items: [E] {get set}
  mutating func addItem(item: E)
}

struct MyStringType: myProtocol {
  typealias E = Int
  var items: [Int] = []
  
  mutating func addItem(item: Int) {
    items.append(item)
  }
}

struct MyGenericStruct<T>: myProtocol {
  typealias E = Int
  var items: [Int] = []
  
  mutating func addItem(item: Int) {
    items.append(item)
  }
  
  func getItemAtIndex(index: Int) -> E? {
    guard items.count > index else { return nil}
    return items[index]
  }
  
  subscript(index: Int) -> E? {
    return getItemAtIndex(index: index)
  }
  
  subscript(range: CountableClosedRange<Int>) -> [E]? {
    get {
      return Array(items[range.lowerBound...range.upperBound])
    }
  }
  
}

var MyList =  MyGenericStruct<Int>()
MyList.addItem(item: 3)
MyList.addItem(item: 4)
MyList.addItem(item: 5)
MyList.addItem(item: 6)
MyList.addItem(item: 7)
MyList.addItem(item: 8)
MyList.addItem(item: 9)
MyList.addItem(item: 1)

var valores = MyList[0...3]
print(valores!)



enum enumGenerico<T> {
  
}
