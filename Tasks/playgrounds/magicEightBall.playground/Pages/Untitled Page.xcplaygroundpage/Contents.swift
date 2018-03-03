import Foundation
import UIKit

func magicEightBall() {
  let randomNum = arc4random_uniform(UInt32(5))
  switch randomNum {
  case 0:
    print("Si")
  case 1:
    print("No")
  case 2:
    print("Tal vez")
  case 3:
    print("Es tu dia de suerte")
  case 4:
    print("Hoy ni salgas andas con mala suerte")
  default:
    print("Vales verde")
  }
}

print("Hoy vere a my crush")
magicEightBall()
