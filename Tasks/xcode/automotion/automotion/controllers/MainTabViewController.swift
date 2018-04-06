//
//  MainTabViewController.swift
//  automotion
//
//  Created by Margaro on 16/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBarItems()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func setUpTabBarItems() {
      guard let unwrappedItems = self.tabBar.items else { return }
      for item in unwrappedItems {
        let setup = setUpItem(item)
        item.badgeValue = setup.0
        item.isEnabled = setup.1
      }
    }
  
    func setUpItem(_ item: UITabBarItem) -> (String?, Bool) {
      guard let unwrappedItemTitle = item.title else { return (nil, false) }
      switch unwrappedItemTitle {
        case "Sales":
          return ("100", true)
        case "Inspection":
          return (nil, false)
        default:
          return (nil, true)
      }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
