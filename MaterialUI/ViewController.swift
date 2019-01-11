//
//  ViewController.swift
//  MaterialUI
//
//  Created by Team Azbow on 1/11/19.
//  Copyright © 2019 oshan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var articleArray: Array<Article>  = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchHomeArticles(){ articles in
            self.articleArray = articles
        }
    }

    
    // With Alamofire
    func fetchHomeArticles(completion: @escaping (_ result: Array<Article> ) -> Void) {
        let url = "https://dykapp-1536452199726.appspot.com/api/v1/article/getArticles"
        let parameters: Parameters = [:]      //This will be your parameter
        
        Alamofire.request(url, method: .post, parameters: parameters)
            .responseJSON { response in
            //print(response)
                
                var itemArray: Array<Article>  = []
                
                let json = JSON(response.data!)
                
                let isSuccess = json[AppConstents.API.API_SUCCESS].boolValue
                
                if  isSuccess{
                    let data = json[AppConstents.API.DATA].array!
                    
                    for item in data {
                        let article = Article.init(data: item)
                        itemArray.append(article)
                    }
                    
                } else {
                    print(json["msg"].string)
                }
                
                
                
                completion(itemArray)
                
        }
    }

    
    
    

}

