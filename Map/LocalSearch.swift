//
//  LocalSearch.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/07/19.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import MapKit
import RxSwift

class LocalSearch {
    
    class func start(query: String, region: MKCoordinateRegion?) -> Observable<[MKMapItem]> {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = query
        
        if let region = region {
            request.region = region
        }
        
        return Observable.create { observer -> Disposable in
            MKLocalSearch(request: request).start { (response, error) in
                if let error = error {
                    observer.onError(error)
                    return
                }
                
                let items = response?.mapItems ?? []
                observer.onNext(items)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
}
