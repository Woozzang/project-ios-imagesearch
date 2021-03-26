//
//  SearchViewController.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/03/26.
//

import UIKit

class SearchViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

      // Do any additional setup after loading the view.

  }
  
  @IBAction func search(sender: UITextField) {
   
  }
}

extension SearchViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailImageViewCell", for: indexPath) as? ThumbnailImageViewCell else {
      return UICollectionViewCell()
    }
    
    //TODO: cell Image 할당
    cell.backgroundColor = .systemBlue
    
    return cell
  }
  
}

extension SearchViewController: UICollectionViewDelegate {
  
  //TODO: 클릭했을 때 모달로 이미지뷰 크게 띄워야함
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}


extension SearchViewController: UICollectionViewDelegateFlowLayout {
  
  //TODO: 셀 사이즈
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let itemSpacing: CGFloat = 10
    let margin: CGFloat = 10
    
    let cellWidth = (collectionView.bounds.width - (margin * 2) - (itemSpacing * 2)) / 3
    let cellHeight = cellWidth
    
    
    return CGSize(width: cellWidth, height: cellHeight)
  }
}




