import Foundation

// Escudo son las cantidades de vida, si los escudos llegan a 0
// Al pasar de 200 balas disparadas se sobrecaliente el arma
// para enfriar el arma se espera 10 segundos se descuenta una vida
// y se vuelve a disparar

var player: [String: Int] = [
  "Shields": 5,
  "FiredBullets": 0,
  "OverheatedWeapon": 0
]

func shootWeapon(_ FiredBullets: Int ) -> Int {
  print("pum pum!")
  return FiredBullets + 1
}

func iosWar(player: [String: Int]) -> [String: Int]{
  var plr = player
  repeat {
    if (plr["OverheatedWeapon"] == 0) {
      plr["FiredBullets"] = shootWeapon(plr["FiredBullets"]!)
      if(plr["FiredBullets"]! % 200 == 0){
        print("Arma sobrecalentada")
        plr["OverheatedWeapon"] = 1
        sleep(5)
      }
    }else {
      plr["OverheatedWeapon"] = 0
      plr["Shields"] = plr["Shields"]! - 1
    }
  }while plr["Shields"] != 0
  return plr
}

player = iosWar(player: player)
