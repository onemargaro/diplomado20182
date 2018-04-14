//
//  DetailViewController.swift
//  fishes
//
//  Created by Margaro on 06/04/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet var detailDescriptionLabel: UILabel!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var image: UIImageView!


  func configureView() {
    // Update the user interface for the detail item.
    if let fish = detailItem {
      self.titleLabel.text = fish.name
      self.detailDescriptionLabel.text = fish.text
      if let url = URL(string: fish.imageUrl) {
        self.image.contentMode = .scaleAspectFit
        self.downloadImage(url: url)
      }
    }
    
  }
  
  
  
  func downloadImage(url: URL) {
    FishService.shared.getDataFromUrl(url: url) { data, response, error in
      guard let data = data, error == nil else { return }
      print(response?.suggestedFilename ?? url.lastPathComponent)
      DispatchQueue.main.async() {
        self.image.image = UIImage(data: data)
      }
    }
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    configureView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  var detailItem: Fish?


}

