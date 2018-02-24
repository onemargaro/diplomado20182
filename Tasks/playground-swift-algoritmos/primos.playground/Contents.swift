//: Playground - noun: a place where people can play

import UIKit

func esPrimo(number: Int) -> Bool {
  if number <= 1 {
    return false
  } else if(number <= 3) {
    return true
  } else if (number % 2 == 0 || number % 3 == 0) {
    return false
  }else {
    var i = 5
    repeat {
      if(number % i == 0 || number % (i+2) == 0){
        return false
      }
      i += 6
    } while(i*i <= number)
  }
  return true
}

for i in 0...10000 {
  esPrimo(number: i) ?  print(i): nil
}
