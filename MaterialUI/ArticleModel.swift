//
//  ArticleModel.swift
//  MaterialUI
//
//  Created by Team Azbow on 1/11/19.
//  Copyright © 2019 oshan. All rights reserved.
//

import Foundation
import SwiftyJSON

class Article {
    var article_view_type: Int?
    var articleColor: String?
    var data: ArticleData?
    
    init(data: JSON) {
        let json = data
        self.articleColor = json["articleColor"].string
        self.article_view_type = json["article_view_type"].int
        self.data = ArticleData.init(data: json["data"])
    }
    
  
    
    
}


class ArticleData {
    var _id: String?
    var updatedAt: String?
    var createdAt: String?
    var rss_feed_id: String?
    var published_date: String?
    var author_name: String?
    var website_url: String?
    var description: String?
    var image_url: String?
    var title: String?
    var user_bookmarked: Bool
    var user_liked: Bool
    
    init(data: JSON) {
        
        let json = data
        
        self._id = json["_id"].string
        self.updatedAt = json["updatedAt"].string
        self.createdAt = json["createdAt"].string
        self.rss_feed_id = json["rss_feed_id"].string
        self.published_date = json["published_date"].string
        self.author_name = json["author_name"].string
        self.website_url = json["website_url"].string
        self.description = json["description"].string
        self.image_url = json["image_url"].string
        self.title = json["title"].string
        self.user_liked = json["user_liked"].boolValue
        self.user_bookmarked = json["user_bookmarked"].boolValue

    }
    
    
}
