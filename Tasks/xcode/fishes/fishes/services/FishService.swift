//
//  FishService.swift
//  fishes
//
//  Created by Margaro on 06/04/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import Foundation

typealias listFishes = ([Fish]) -> Void

class FishService {
  let baseURL = URL(string: "https://plasticfishes.herokuapp.com")!
  let session = URLSession.shared
  
  static let shared = FishService()
  
  func all(sucess: @escaping listFishes) {
    let url = baseURL.appendingPathComponent("api/fishes")
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let task = session.dataTask(with: request) { [weak self] (data, response, error) in
      guard error == nil else { return }
      guard let httpResponse = response as? HTTPURLResponse else { return }
      switch httpResponse.statusCode {
        case 200:
//          parse something
          self?.parseFishes(data, completion: sucess)
        default:
          return
      }
    }
    task.resume()
  }
  
  func parseFishes(_ data: Data?, completion: @escaping listFishes) -> Void {
    guard let data = data else { return }
    let decoder = JSONDecoder()
    do {
     let json = try decoder.decode([Fish].self, from: data)
      DispatchQueue.main.async {
       completion(json)
      }
    } catch let err {
      print("Parsing Error: \(err)")
    }
  }
  
  
  func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      completion(data, response, error)
      }.resume()
  }
}
