//
//  ImageSearchViewController.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/06/21.
//

import UIKit

class ImageSearchViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var collectionView: UICollectionView!
  
  var viewModel: ImageSearchViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Image Search"
    
    configureSearchBar()
    configureCollectionView()
  }
  
  func configureSearchBar() {
    
    searchBar.delegate = self
    
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
  }
  
  func configureCollectionView() {
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
}

extension ImageSearchViewController: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    print(#function)
    
  }
}

extension ImageSearchViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
    
//    cell.backgroundColor = .blue
    return cell
  }
}

extension ImageSearchViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSpacing: CGFloat = 10
    
    let cellWidth = (collectionView.bounds.width - (itemSpacing * 2)) / 3
    let cellHeight = cellWidth
    
    return CGSize(width: cellWidth, height: cellHeight)
  }
}
