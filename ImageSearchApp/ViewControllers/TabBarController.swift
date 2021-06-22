//
//  TabBarController.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/06/21.
//

import UIKit

class TabBarController: UITabBarController {
  
  private var searchTabNavigationController: UINavigationController = {
    let nav = UINavigationController()
    
    let storyboard = UIStoryboard(name: "ImageSearch", bundle: Bundle.main)
    let imageSearchVC = storyboard.instantiateViewController(identifier: "ImageSearchViewController") as! ImageSearchViewController
    
    // DI
    imageSearchVC.viewModel = ImageSearchViewModel()
    
    nav.pushViewController(imageSearchVC, animated: true)
    
    let title = "Search"
    let image = UIImage(systemName: "magnifyingglass")
    
    nav.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)
    
    return nav
  }()
  
  private var likedNavigationController: UINavigationController = {
    let nav = UINavigationController()
    
    let storyboard = UIStoryboard(name: "Liked", bundle: Bundle.main)
    let likedVC = storyboard.instantiateInitialViewController() as! LikedTableViewController
    
    nav.pushViewController(likedVC, animated: true)
    
    let title = "Liked"
    let image = UIImage(systemName: "hand.thumbsup")
    
    nav.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)
    
    return nav
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    configureTabBar(with: [searchTabNavigationController, likedNavigationController])
  }
    
  func configureTabBar(with viewControllers: [UIViewController]) {
    
    self.setViewControllers(viewControllers, animated: true)
  }
}
