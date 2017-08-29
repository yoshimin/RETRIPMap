//
//  TwitterAPIClient.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation
import RxSwift
import TwitterKit

public protocol TwitterAPIClient {
    associatedtype Response
    static func sendTwitterRequest(request: TwitterAPIRequest) -> Observable<Response>
    static func parseResponse(from object: Any) -> Response
}

extension TwitterAPIClient {
    static func sendTwitterRequest(request: TwitterAPIRequest) -> Observable<Response> {
        return Observable.create { observer -> Disposable in
            let client = TWTRAPIClient()
            
            var err : NSError?
            let req = client.urlRequest(withMethod: request.method, url: request.url, parameters: request.parameters, error: &err)
            
            client.sendTwitterRequest(req, completion: { (response, data, error) -> Void in
                if error != nil {
                    print("error: \(error.debugDescription)")
                    observer.onError(ApplicationError.apiError)
                    return
                }
                
                guard let data = data, let jsonObject = try? JSONSerialization.jsonObject(with: data) else {
                    observer.onError(ApplicationError.parseError)
                    return
                }
                
                let object = parseResponse(from: jsonObject)
                observer.onNext(object)
                observer.onCompleted()
            })
            return Disposables.create()
        }
    }
}
