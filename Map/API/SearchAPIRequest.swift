//
//  SearchAPIRequest.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation

class SearchAPIRequest: TwitterAPIRequest {
    var query: String! = ""
    
    var url: String {
        return "https://api.twitter.com/1.1/search/tweets.json"
    }
    
    var method: String {
        return "GET"
    }
    
    var parameters: [AnyHashable : Any]? {
        return ["q": query]
    }
}
