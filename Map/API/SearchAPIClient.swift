//
//  SearchAPIClient.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation
import TwitterKit
import RxSwift
import Himotoki

class SearchAPIClient: TwitterAPIClient {
    typealias Response = [Status]
    
    class func search(query: String!) -> Observable<[Status]> {
        let request = SearchAPIRequest()
        request.query = query
        return sendTwitterRequest(request: request)
    }
    
    static func parseResponse(from object: Any) -> [Status] {
        guard let result = try? SearchResult.decodeValue(object) else {
            return []
        }
        return result.statuses
    }
}
