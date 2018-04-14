//
//  Fish.swift
//  fishes
//
//  Created by Margaro on 06/04/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import Foundation

struct Fish: Decodable {
  let id: String
  let name: String
  let text: String
  let apiUrl: String
  let webUrl: String
  let imageUrl: String

  enum CodingKeys: String, CodingKey {
    case apiUrl = "api_url"
    case webUrl = "web_url"
    case imageUrl = "image_url"
    case id, name, text
  }
}
