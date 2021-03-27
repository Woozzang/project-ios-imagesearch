//
//  SearchResultManager.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/03/26.
//

import Foundation
import UIKit

class SearchResultManager {
    
  static let shared = SearchResultManager()
  private(set) var searchResultList = [SearchResult]()
  var searchVC: SearchViewController?

  let dateFormatter = { () -> DateFormatter in
    // "datetime": "2017-06-21T15:59:30.000+09:00"
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-DD'T'HH:mm:ss.SSSZZZZZ"
    return formatter
  }()
  
  let decoder = JSONDecoder()
  
  private init() {
    
    decoder.dateDecodingStrategy = .formatted(self.dateFormatter)
  }
  
}

//MARK: API concerned
extension SearchResultManager {
  
  enum HTTPMethod:String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
  }
  
  //struct로 선언해서 static let 으로 만드는 것과 무슨 차이가 있을까?
  enum KaKaoImageSearchAPIComponent: String {
    case scheme = "https"
    case host = "dapi.kakao.com"
    case path = "/v2/search/image"
    case apiKey = "KakaoAK 10c86192c308600290f841f69714f5e7"
  }
  
  func request(for query: String, method: HTTPMethod = .get) {
    
    SearchResultManager.shared.searchResultList.removeAll()
    
    guard let url = createComponents(searchKey: query).url else { fatalError("\(#function) - Invalid URL.") }
    
    var request = URLRequest(url: url)
    request.addValue(KaKaoImageSearchAPIComponent.apiKey.rawValue, forHTTPHeaderField: "Authorization")
    
    let session = URLSession.shared
    
    //data = binary, response = 서버응답, error = 오류 발생시, 없으면 nil
    let task = session.dataTask(with: request) { (data, response, error) in
      
      if let error = error {
        print(error)
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse else {
        print( "Invalid Response" )
        return
      }
      
      guard (200...299).contains(httpResponse.statusCode) else {
        print("Status Code: ", httpResponse.statusCode)
        return
      }
      
      guard let data = data else {
        fatalError("Invalid Data")
      }
      
      do {
        let responseData = try SearchResultManager.shared.decoder.decode(ResponseData.self, from: data)
        
        responseData.documents.forEach { SearchResultManager.shared.searchResultList.append($0) }
        
      } catch {
        print(error)
      }
      
      DispatchQueue.main.async {
        self.searchVC?.collectionView.reloadData()
      }
    }
    
    task.resume()
  }
  
  private func createComponents(searchKey query: String, page: Int = 1, size: Int = 80) -> URLComponents {
    var components = URLComponents()
    
    components.scheme = KaKaoImageSearchAPIComponent.scheme.rawValue
    components.host = KaKaoImageSearchAPIComponent.host.rawValue
    components.path = KaKaoImageSearchAPIComponent.path.rawValue
    
    components.queryItems = [
        URLQueryItem(name: "query", value: "\(query)"),
        URLQueryItem(name: "page", value: "\(page)"),
        URLQueryItem(name: "size", value: "\(size)")
      ]
    
    return components
  }
}
