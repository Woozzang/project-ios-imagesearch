////
////  DetailPhotoViewController.swift
////  ImageSearchApp
////
////  Created by Woochan Park on 2021/03/27.
////
//
//import UIKit
//
//class DetailPhotoViewController: UIViewController {
//  
//  @IBOutlet weak var imageView: UIImageView!
//  var searchResult: SearchResult?
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    guard let searchResult = searchResult else { print("\(#function)"); return }
//    
//    guard let imageURL = URL(string: searchResult.imageURL) else { print("\(#function)"); return }
//    
//    self.loadOriginalImage(from: imageURL)
//      // Do any additional setup after loading the view.
//  }
//  
//  func loadOriginalImage(from url: URL) {
//    
//    let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
//      if let error = error { print(error); return }
//      
//      guard let httpResponse = response as? HTTPURLResponse else { print( "Invalid Response" ); return }
//      
//      guard (200...299).contains(httpResponse.statusCode) else {
//        print("Status Code: ", httpResponse.statusCode)
//        return
//      }
//      
//      guard let data = data else {
//        fatalError("Invalid Data")
//      }
//      
//      guard let image = UIImage(data: data) else { print("\(#function) - Failed to make Original Image."); return }
//      
//      DispatchQueue.main.async {
//        self?.imageView.image = image
//      }
//    }
//    
//    task.resume()
//  }
//}
