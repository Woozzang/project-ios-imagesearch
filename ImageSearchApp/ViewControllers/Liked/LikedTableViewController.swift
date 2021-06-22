//
//  LikedTableViewController.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/06/22.
//

import UIKit

class LikedTableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func configureTableView() {
    
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of rows
      return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "likedCell", for: indexPath)
    
    cell.backgroundColor = .red
    
    return cell
  }
}
