//
//  SearchResult.swift
//  ImageSearchApp
//
//  Created by Woochan Park on 2021/03/26.
//

import Foundation

struct SearchResult: Codable {
  
  var collection: String
  var dateTime: Date
  var siteName: String?
  
  var docURL: String
  var thumbnailURL: String
  var imageURL: String
  
  enum CodingKeys: String, CodingKey {
    case collection
    case dateTime = "datetime"
    case siteName = "display_sitename"
    
    case docURL = "doc_url"
    case thumbnailURL = "thumbnail_url"
    case imageURL = "image_url"
  }
}

struct ResponseData: Codable {
  let documents: [SearchResult]
  let meta: MetaData
}

struct MetaData: Codable {
  let isEnd: Bool
  let pageableCount: Int
  let totalCount: Int
  
  // decoder.keyDecodingStrategy = .convertFromSnakeCase
  enum CodingKeys: String, CodingKey {
    case isEnd = "is_end"
    case pageableCount = "pageable_count"
    case totalCount = "total_count"
  }
}
