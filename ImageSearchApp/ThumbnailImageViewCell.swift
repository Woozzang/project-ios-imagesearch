//
//  ThumbnailImageViewCell.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/03/26.
//

import UIKit

class ThumbnailImageViewCell: UICollectionViewCell {
  
  @IBOutlet var thumbnailImage: UIImageView!
  private(set) var URL: String?
  
  func loadImage(from url: URL) {
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
      if let error = error { print(error); return }
      
      guard let httpResponse = response as? HTTPURLResponse else { print( "Invalid Response" ); return }
      
      guard (200...299).contains(httpResponse.statusCode) else {
        print("Status Code: ", httpResponse.statusCode)
        return
      }
      
      guard let data = data else {
        fatalError("Invalid Data")
      }
      
      guard let image = UIImage(data: data) else { print("\(#function) - Failed to make thumbnail Image."); return }
      
      self?.thumbnailImage.image = image
    }
    
    task.resume()
  }
}
