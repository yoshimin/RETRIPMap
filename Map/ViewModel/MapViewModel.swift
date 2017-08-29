//
//  MapViewModel.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/07/21.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation
import MapKit
import RxSwift
import RxCocoa

class MapViewModel {
    
    let userTrackingMode: Observable<MKUserTrackingMode>
    let setCenter = PublishSubject<Void>()
    let search = PublishSubject<MKCoordinateRegion>()
    let annotations: Observable<[Annotation]>
    let selectedAnnotationView = PublishSubject<MKAnnotationView>()
    let url: Observable<String>
//    let statuses: Observable<[Status]>
    
    init() {
        userTrackingMode = LocationManager.shared.authorized
            .asObservable()
            .map({ authorized -> MKUserTrackingMode in
                guard authorized == true else {
                    return .none
                }
                return .follow
            })
        
        annotations = search
            .flatMapLatest { region -> Observable<[MKMapItem]> in
                return LocalSearch.start(query: "駅", region: region)
            }
            .map { items -> [Annotation] in
                return items.map{ Annotation(coordinate: $0.placemark.coordinate, title:$0.name) }
        }
        
        url = selectedAnnotationView
            .flatMapLatest { annotationView -> Observable<String> in
                guard
                    let annotation = annotationView.annotation,
                    let title: NSString = annotation.title as? NSString  else {
                        return Observable.just("")
                }
                let spot = title.replacingOccurrences(of: "駅", with: "")
                let url = "https://twitter.com/search?f=tweets&q=from:retrip_news/" + spot.urlEncode()
                return Observable.just(url)
        }
        
        
//        statuses = selectedAnnotationView
//            .flatMapLatest { annotationView -> Observable<[Status]> in
//                guard
//                    let annotation = annotationView.annotation,
//                    let title: NSString = annotation.title as? NSString  else {
//                    return Observable.just([])
//                }
//                let location = title.replacingOccurrences(of: "駅", with: "")
//                let query = "from:retrip_news/" + location
//                return SearchAPIClient.search(query: query)
//        }
    }
}
