//
//  main.swift
//  Weather
//
//  Created by Margaro on 03/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

UIApplicationMain(CommandLine.argc,
                  UnsafeMutableRawPointer(CommandLine.unsafeArgv)
                    .bindMemory(
                      to: UnsafeMutablePointer<Int8>.self,
                      capacity: Int(CommandLine.argc)),
                  NSStringFromClass(MyApplication.self),
                  NSStringFromClass(AppDelegate.self)
)
