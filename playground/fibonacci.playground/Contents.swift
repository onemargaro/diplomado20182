//: Playground - noun: a place where people can play

import UIKit

func fibonacci(number: Int) -> Int {
  let sqrt = (5.0).squareRoot();
  let a = pow(((1 + sqrt) / 2), Double(number))
  return Int((a / sqrt).rounded());
}

for i in 0...10 {
 print(fibonacci(number: i))
}
