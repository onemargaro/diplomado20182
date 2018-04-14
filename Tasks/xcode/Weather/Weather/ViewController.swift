//
//  ViewController.swift
//  Weather
//
//  Created by Margaro on 03/03/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&units=metric&appid=3fe96ab189079bcca9932be0cb2ab3cf")
    
    let task = URLSession.shared.dataTask(
      with: url!,
      completionHandler: { (data, response, error) in
        self.loadInfo(data: data, response: response, error: error)
      }
    )
    
//    El resume dice que hagas la consulta y traer la información, si es exitoso ejecuta lo de completionHandler
    task.resume()
  }
  
  func loadInfo(data: Data?,response: URLResponse?,error: Any?) {
    if (data != nil) {
      do {
        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
        //            print(json)
        DispatchQueue.main.async {
          if let main = json!["main"] as! [String: Any]? {
            print(main)
            self.temperatureLabel.text = "\(main["temp"] as! Double)º C"
          }
          self.locationLabel.text = json!["name"] as? String
        }
      } catch let e {
        print("Error retrieving weather data: \(e)")
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

