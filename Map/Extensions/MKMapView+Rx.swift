//
//  MKMapView+Rx.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa
import MapKit

extension Reactive where Base: MKMapView {
    public var delegate: DelegateProxy {
        return RxMapViewDelegateProxy.proxyForObject(base)
    }
    
    public var didSelect: Observable<MKAnnotationView> {
        return delegate
            .methodInvoked(#selector(MKMapViewDelegate.mapView(_:didSelect:)))
            .map {
                let annotationView = $0[1] as! MKAnnotationView
                return annotationView
        }
    }
}
