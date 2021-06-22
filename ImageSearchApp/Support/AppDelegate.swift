//
//  AppDelegate.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/03/26.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    //TODO: 탭바 컨트롤러 코드로 만들어서 띄우기
    //TODO: 의존성 주입하기 위해서 전체 코드로 만들기
    //MVVM 으로 작성하기
    //좋아요 구현하기
    
    let tabBarController = TabBarController()
    
    window?.rootViewController = tabBarController
    
    window?.makeKeyAndVisible()
    
    return true
  }
}

