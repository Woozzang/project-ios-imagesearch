//
//  SearchViewController.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/03/26.
//

import UIKit

class SearchViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    SearchResultManager.shared.searchVC = self
      // Do any additional setup after loading the view.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "DetailPhotoViewSegue" {
      guard let vc = segue.destination as? DetailPhotoViewController else { print("\(#function) - Casting Failure to DetailPhotoViewController") ; return }
      vc.searchResult = sender as? SearchResult
    }
  }
}

extension SearchViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return SearchResultManager.shared.searchResultList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailImageViewCell", for: indexPath) as? ThumbnailImageViewCell else {
      return UICollectionViewCell()
    }
    
    let urlString = SearchResultManager.shared.searchResultList[indexPath.item].thumbnailURL
    
    guard let url = URL(string: urlString) else { return UICollectionViewCell()}
    
    cell.loadImage(from: url)
    
    return cell
  }
  
}

extension SearchViewController: UICollectionViewDelegate {
  
  //TODO: 클릭했을 때 모달로 이미지뷰 크게 띄워야함
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    performSegue(withIdentifier: "DetailPhotoViewSegue", sender: SearchResultManager.shared.searchResultList[indexPath.item])
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

extension SearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    guard let searchKey = textField.text else { return false }
    
    // 컬렉션뷰의 reloadData() 를 호출해야 하는 시점
    // == SearchResultManger에서 SearchResultList 가 모두 채워진 시점
    // 어떻게 해결하지? -> Notification 으로 한번 해보자
    SearchResultManager.shared.request(for: searchKey)
    
    return true
  }
}


