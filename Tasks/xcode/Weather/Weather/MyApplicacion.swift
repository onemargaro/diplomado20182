//
//  MyApplicacion.swift
//  Weather
//
//  Created by Margaro on 03/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class MyApplication: UIApplication {
  override func sendEvent(_ event: UIEvent) {
    print(event)
    super.sendEvent(event)
  }
}
