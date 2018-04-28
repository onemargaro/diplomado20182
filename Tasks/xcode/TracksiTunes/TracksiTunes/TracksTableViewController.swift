//
//  TracksTableViewController.swift
//  TracksiTunes
//
//  Created by Margaro on 27/04/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit
import Alamofire
class TracksTableViewController: UITableViewController, UISearchBarDelegate {
  
    let reuseIdentifier = "rowId"
  
    var tracks: [Track] = [
        Track(trackName: "Nombre", artistName: "album"),
        Track(trackName: "Nombre", artistName: "album")
    ]
  
  let mySearchController = UISearchController(searchResultsController: nil)
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.gray
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        navigationItem.searchController = mySearchController // le asigno una barra de busqueda
        navigationItem.hidesSearchBarWhenScrolling = false // muestra la barra de busqueda de manera inmediata
  
    mySearchController.dimsBackgroundDuringPresentation = false
    mySearchController.searchBar.delegate = self
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    let url = "https://itunes.apple.com/search?term=\(searchText)"
    Alamofire.request(url).responseData { (dataResponse) in
      if  let error = dataResponse.error {
        print("Hubo un error", error)
        return
      }
      guard let data = dataResponse.data else { return }
      let testString = String(data: data, encoding: .utf8)
      
      print(testString ?? "")
      self.tracks = []
      do {
        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        print("Results: ", searchResult.resultCount)
        searchResult.results.forEach({ (trck) in
          print(trck.artistName, trck.trackName)
          self.tracks.append(Track(trackName: trck.trackName, artistName: trck.artistName))
        })
        self.tableView.reloadData()
      } catch let decodeError {
        print("Error ", decodeError)
      }
    }
  }
  
  struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Track]
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tracks.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = tracks[indexPath.row].trackName
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
