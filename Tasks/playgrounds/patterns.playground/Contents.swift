//: Playground - noun: a place where people can play

import UIKit

protocol Taco {
  
  var costo: Double { get }
  var descripcion: String { get }
  
}

class TacoDeCarnitas: Taco {
  var costo: Double {
    get {
      return 30.0
    }
  }
  
  var descripcion: String {
    get {
      return "Taco de Carnitas"
    }
  }
}

class TacoDecorator: Taco {
  let tacoInstance: Taco
  var costo: Double {
    get {
      return tacoInstance.costo
    }
  }
  
  var descripcion: String {
    get {
      return tacoInstance.descripcion
    }
  }
  
  required init(taco: Taco) {
    self.tacoInstance = taco
  }
  
}

class Cilantro: TacoDecorator {
  override var costo: Double {
    return tacoInstance.costo + 20
  }
  override var descripcion: String {
    get {
      return tacoInstance.descripcion + " con cilandro"
    }
  }
  
  required init(taco: Taco) {
    super.init(taco: taco)
  }
}

class Aguacate: TacoDecorator {
  override var costo: Double {
    return tacoInstance.costo + 50
  }
  override var descripcion: String {
    get {
      return tacoInstance.descripcion + " con aguacate"
    }
  }
  required init(taco: Taco) {
    super.init(taco: taco)
  }
}

func main() {
  var tacoDeCarnitas: Taco = TacoDeCarnitas()
  print("Hicimos un \(tacoDeCarnitas.descripcion)")
  
  tacoDeCarnitas = Cilantro(taco: tacoDeCarnitas)
  print("Hicimos un \(tacoDeCarnitas.descripcion)")
  
  tacoDeCarnitas = Aguacate(taco: tacoDeCarnitas)
  print("Hicimos un \(tacoDeCarnitas.descripcion)")
  
  print("Pagaré $\(tacoDeCarnitas.costo)")
}

main()























