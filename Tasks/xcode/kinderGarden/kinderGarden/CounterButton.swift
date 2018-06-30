//
//  CounterButton.swift
//  kinderGarden
//
//  Created by Margaro on 16/06/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class CounterButton: UIButton {
  
  private var halfWidth: CGFloat {
    return bounds.width / 2
  }
  
  private var halfHeigt: CGFloat {
    return bounds.height / 2
  }

  // Only override draw() if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func draw(_ rect: CGRect) {
    let path = UIBezierPath(ovalIn: rect)
    UIColor.green.setFill()
    path.fill()
    
    let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
    
    let halfPlusWidth = plusWidth / 2
    
    let plusPath = UIBezierPath()
    plusPath.lineWidth = 3.0
    
    plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth , y: halfHeigt))
    plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHeigt ))
    
    UIColor.white.setStroke()
    plusPath.stroke()
  }

}
