//: Playground - noun: a place where people can play

import UIKit

func esPrimo(number: Int) -> Bool {
  if number <= 1 {
    return false
  }else if(number <= 3) {
    return true
  }
  if (number % 2 == 0 || number % 3 == 0) {
    return false
  }
  var i = 5
  repeat {
    if(number % i == 0 || number % (i+2) == 0){
      return false
    }
    i += 6
  } while(i*i <= number)
  return true
}

func fibonacci(number: Int) -> Int {
  let sqrt = (5.0).squareRoot();
  let a = pow(((1 + sqrt) / 2), Double(number))
  return Int((a / sqrt).rounded());
}

for i in 0...10 {
  let fibo: Int = fibonacci(number: i)
  esPrimo(number: fibo) ? print(fibo) : nil
}

