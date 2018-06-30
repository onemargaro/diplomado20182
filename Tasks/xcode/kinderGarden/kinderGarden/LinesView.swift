//
//  LinesView.swift
//  kinderGarden
//
//  Created by Margaro on 16/06/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class LinesView: UIView {
  
  override func draw(_ rect: CGRect)  {
    let context = UIGraphicsGetCurrentContext()
    UIColor.black.setStroke()
    context!.setLineWidth(5)
    context!.move(to: CGPoint(x: 0, y: 0))
    context!.addLine(to: CGPoint(x: 100, y: 100))
    context!.addLine(to: CGPoint(x: 100, y: 200))
    context!.strokePath()
  }
  
}
