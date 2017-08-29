//
//  RxMapViewDelegateProxy.swift
//  Map
//
//  Created by 新谷　よしみ on 2017/08/03.
//  Copyright © 2017年 yoshimi. All rights reserved.
//

import RxSwift
import RxCocoa
import MapKit

public class RxMapViewDelegateProxy: DelegateProxy, MKMapViewDelegate, DelegateProxyType {
    public static func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let mapview: MKMapView = object as! MKMapView
        return mapview.delegate
    }
    
    public static func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let mapview: MKMapView = object as! MKMapView
        if let delegate = delegate {
            mapview.delegate = (delegate as! MKMapViewDelegate)
        } else {
            mapview.delegate = nil
        }
    }
}
