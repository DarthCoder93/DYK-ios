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

class ViewController: UIViewController, UITableViewDataSource {

    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
     var items: Array<Article>  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        tableView.dataSource = self
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        
        tableView?.register(ArticleViewType1.nib, forCellReuseIdentifier: ArticleViewType1.identifier)
        tableView?.register(ArticleViewType2.nib, forCellReuseIdentifier: ArticleViewType2.identifier)
        tableView?.register(ArticleViewType3.nib, forCellReuseIdentifier: ArticleViewType3.identifier)
    
        fetchHomeArticles(){ articles in
            self.items = articles
            self.tableView.reloadData()
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
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let item = items[indexPath.section]
           // print(item.article_view_type)
            switch item.article_view_type {
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleViewType1.identifier, for: indexPath) as? ArticleViewType1 {
                    
                    return cell
                }
            case 2:
                if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleViewType2.identifier, for: indexPath) as? ArticleViewType2 {
                    
                    return cell
                }
            case 3:
                if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleViewType3.identifier, for: indexPath) as? ArticleViewType3 {
                    
                    return cell
                }
                
            case .none:
                if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleViewType1.identifier, for: indexPath) as? ArticleViewType1 {
                    
                    return cell
                }
            case .some(_):
                if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleViewType1.identifier, for: indexPath) as? ArticleViewType1 {
                    
                    return cell
                }
            }
            return UITableViewCell()
        }
    
    
    
    

}

