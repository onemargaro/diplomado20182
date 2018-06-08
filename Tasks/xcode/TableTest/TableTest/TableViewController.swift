//
//  TableViewController.swift
//  TableTest
//
//  Created by Margaro on 26/05/18.
//  Copyright © 2018 Margaro. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var alumnos = ["Julio", "Parra", "German", "Roberto", "Luis", "Pedro", "Julio", "Parra", "German", "Roberto", "Luis", "Pedro", "Julio", "Parra", "German", "Roberto", "Luis", "Pedro", "Julio", "Parra", "German", "Roberto", "Luis", "Pedro", "Julio", "Parra", "German", "Roberto", "Luis", "Pedro","Julio", "Parra", "German", "Roberto", "Luis", "Pedro","Julio", "Parra", "German", "Roberto", "Luis", "Pedro","Julio", "Parra", "German", "Roberto", "Luis", "Pedro"]
    var allAlumnos = ["Julio", "Parra", "German", "Roberto", "Luis", "Pedro"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
  
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
  
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
  
  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    self.alumnos.insert(self.alumnos.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
    self.tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return self.alumnos[indexPath.row].hasPrefix("P")
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let alertController = UIAlertController(title: "Marcando alumnos", message: "¿Desea marcarlo?", preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
    let cell = tableView.cellForRow(at: indexPath)
    let okAction = UIAlertAction(title: cell?.accessoryType == .checkmark ? "DeOk": "Ok", style: .default) { (action) in
      cell?.accessoryType = cell?.accessoryType == .checkmark ? .none : .checkmark
    }
    alertController.addAction(cancelAction)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }

//  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//    cell.alpha = 0
//    UIView.animate(withDuration: 2.0) {
//      cell.alpha = 1
//    }
//  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let rotationAngleinRadians = 90 * CGFloat(.pi / 180.0)
    let rotationTransform = CATransform3DMakeRotation(rotationAngleinRadians, 20, 0, 20)
    cell.layer.transform = rotationTransform
    UIView.animate(withDuration: 1.0) {
      cell.layer.transform = CATransform3DIdentity
    }
  }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alumnos.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = alumnos[indexPath.row]

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
  
  override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let deleteAction = UIContextualAction(style: .destructive, title: "Borrame") {
      (action, sourceView, completionHanlder) in
      self.alumnos.remove(at: indexPath.row)
      self.tableView.deleteRows(at: [indexPath], with: .middle)
      completionHanlder(true)
    }
    
    let shareAction = UIContextualAction(style: .normal, title: "Share") {
      (action, sourceView, completionHandler) in
      let message = "Share"
      let activityController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
      self.present(activityController, animated: true, completion: nil)
    }
    
    shareAction.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    
    return UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
  }
  
  override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .normal, title: "Recover") { (action, sourceView, completionHandler) in
      self.alumnos = self.allAlumnos
      self.tableView.reloadData()
      completionHandler(true)
    }])
  }

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            alumnos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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
