//: Playground - noun: a place where people can play

import UIKit

func factorial(n: Int) -> Int{
  if n == 0 || n == 1 {
    return 1
  }else{
    return n * factorial(n: n-1)
  }
}

// factorial(n: 6)
