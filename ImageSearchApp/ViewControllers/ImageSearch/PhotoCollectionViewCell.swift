//
//  PhotoCollectionViewCell.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/06/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    configureImageView()
  }
  
  func configureImageView() {
    imageView.backgroundColor = .blue
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    self.imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
}
