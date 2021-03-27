import Foundation

struct SearchResult: Codable {
  
  var collection: String
  var dateTime: Date
  var siteName: String?
  
  var docURL: String
  var thumbnailURL: String
  var imageURL: String
  
  var imageWidth: Int
  var imageHeight: Int
  
  
  enum CodingKeys: String, CodingKey {
    
    case collection
    case dateTime = "datetime"
    case siteName = "display_sitename"
    
    case docURL = "doc_url"
    case thumbnailURL = "thumbnail_url"
    case imageURL = "image_url"
    
    case imageWidth = "width"
    case imageHeight = "height"
  }
}

let jsonStr = """
{
  "collection": "news",
  "thumbnail_url": "https://search2.kakaocdn.net/argon/130x130_85_c/36hQpoTrVZp",
  "image_url": "http://t1.daumcdn.net/news/201706/21/kedtv/20170621155930292vyyx.jpg",
  "width": 540,
  "height": 457,
  "display_sitename": "한국경제TV",
  "doc_url": "http://v.media.daum.net/v/20170621155930002",
  "datetime": "2017-06-21T15:59:30.000+09:00"
}
"""

let decoder = JSONDecoder()

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-DD'T'HH:mm:ss.SSSZZZZZ"


decoder.dateDecodingStrategy = .formatted(formatter)

guard let jsonData = jsonStr.data(using: .utf8) else {
   fatalError()
}


do {
  let test = try decoder.decode(SearchResult.self, from: jsonData)
  dump(test)
  
} catch {
  print(error)
}

