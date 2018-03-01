* [Primos](https://github.com/onemargaro/diplomado20182/blob/master/Tasks/playground-swift-algoritmos/primos.playground/Contents.swift):
  ```swift
   import UIKit
   func esPrimo(number: Int) -Bool {
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
   // esPrimo(number: 101)
  ```
* [Fibonacci](https://github.com/onemargaro/diplomado20182/blob/master/Tasks/playground-swift-algoritmos/fibonacci.playground/Contents.swift):

  ```swift
  import UIKit
  func fibonacci(number: Int) -> Int {
    let sqrt = (5.0).squareRoot();
    let a = pow(((1 + sqrt) / 2), Double(number))
    return Int((a / sqrt).rounded());
  }
  // for i in 0...10 {
  //   print(fibonacci(number: i))
  // }
  ```

* [Primos De Fibonacci](https://github.com/onemargaro/diplomado20182/blob/master/Tasks/playground-swift-algoritmos/fibonacci-primos.playground/Contents.swift)

  ```swift
  for i in 0...10 {
    let fibo: Int = fibonacci(number: i)
    esPrimo(number: fibo) ? print(fibo) : nil
  }
  ```

* [Checar si una palabra es un palindromo](https://github.com/onemargaro/diplomado20182/blob/master/Tasks/playground-swift-algoritmos/palindromo.playground/Contents.swift):

  ```swift
  import UIKit
  func sonPalindromos(cadena: String) -> Bool {
    if String(cadena.reversed()) == cadena {
      return true
    } else {
      return false
    }
  }
  // sonPalindromos(cadena: "anitalavalatina")
  ```

* [Compara dos cadenas](https://github.com/onemargaro/diplomado20182/blob/master/Tasks/playground-swift-algoritmos/compara.playground/Contents.swift):
  ```swift
  import UIKit
  func compara(cadena1: String, cadena2: String) -> Bool {
    if cadena1.count == cadena2.count {
      for i in cadena1 {
        let num1: Int = Array(cadena1).filter{ _ in Array(cadena1).contains(i) }.count
        let num2: Int = Array(cadena2).filter{ _ in Array(cadena2).contains(i) }.count
        if num1 != num2 {
          return false
        }
      }
      return true
    }
    return false
  }
  // compara(cadena1: "holi", cadena2: "holi")
  ```
